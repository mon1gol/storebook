import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storebook/data/models/book.dart';
import 'package:storebook/data/repositories/abstract_book_repository.dart';
import 'package:storebook/data/repositories/book_favorites_repository.dart';

part 'book_list_event.dart';
part 'book_list_state.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  BookListBloc(this.bookRepository, this.localBookRepository)
    : super(BookListInitial()) {
    on<LoadBookList>((event, emit) async {
      try {
        if (state is! BookListLoaded) {
          emit(BookListLoading());
        }

        final bookList = await bookRepository.getBooksList();
        emit(BookListLoaded(bookList: bookList));
      } catch (e) {
        emit(BookListLoadingFail(exception: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<LoadBookListBySearch>((event, emit) async {
      try {
        if (state is! BookListLoaded) {
          emit(BookListLoading());
        }

        final bookList = await bookRepository.getBooksBySearch(
          event.searchParam,
        );
        emit(BookListLoaded(bookList: bookList));
      } catch (e) {
        emit(BookListLoadingFail(exception: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<AddBookToFavorites>((event, emit) async {
      try {
        final currentState = state;
        if (currentState is! BookListLoaded) return;

        await localBookRepository.addBook(event.book);

        final updatedList = currentState.bookList.map((book) {
          if (book.id == event.book.id) {
            return book.copyWith(isFavorite: true);
          }
          return book;
        }).toList();

        emit(BookListLoaded(bookList: updatedList));
      } catch (e) {
        emit(BookListLoadingFail(exception: e));
      }
    });

    on<GetFavorites>((event, emit) async {
      try {
        emit(BookListLoading());
        
        final listFavorites = await localBookRepository.getFavorites();

        emit(BookListLoaded(bookList: listFavorites));
      } catch (e) {
        emit(BookListLoadingFail(exception: e));
      }
    });
  }

  final AbstractLocalBookRepository localBookRepository;
  final AbstractBookRepository bookRepository;
}

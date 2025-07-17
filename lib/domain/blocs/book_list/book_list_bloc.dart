import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storebook/data/models/book.dart';
import 'package:storebook/data/repositories/abstract_book_repository.dart';

part 'book_list_event.dart';
part 'book_list_state.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  BookListBloc(this.bookRepository) : super(BookListInitial()) {
    on<LoadBookList>((event, emit) async {
      try {
        final bookList = await bookRepository.getBooksList();
        emit(BookListLoaded(bookList: bookList));
      } catch (e) {
        emit(BookListLoadingFail(exception: e));
      }
    });
  }

  final AbstractBookRepository bookRepository;
} 
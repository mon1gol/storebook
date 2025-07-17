part of 'book_list_bloc.dart';

class BookListState {}

class BookListInitial extends BookListState {}

class BookListLoading extends BookListState{}

class BookListLoaded extends BookListState{
  BookListLoaded({required this.bookList});

  final List<Book> bookList;
}

class BookListLoadingFail extends BookListState{
  BookListLoadingFail({this.exception});

  final Object? exception;
}

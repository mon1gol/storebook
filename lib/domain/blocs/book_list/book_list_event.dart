part of 'book_list_bloc.dart';

class BookListEvent {}

class LoadBookList extends BookListEvent {
  LoadBookList({this.completer});

  final Completer? completer;
}
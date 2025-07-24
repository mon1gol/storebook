part of 'book_list_bloc.dart';

abstract class BookListEvent extends Equatable{}

class LoadBookList extends BookListEvent {
  LoadBookList({this.completer});

  final Completer? completer;
  
  @override
  List<Object?> get props => [completer];
}

class LoadBookListBySearch extends BookListEvent {
  LoadBookListBySearch({this.completer, required this.searchParam});

  final Completer? completer;
  final String searchParam;
  
  @override
  List<Object?> get props => [completer, searchParam];
}

class AddBookToFavorites extends BookListEvent {
  AddBookToFavorites({required this.book});

  final Book book;
  
  @override
  List<Object?> get props => [book];
}

class GetFavorites extends BookListEvent {
  @override
  List<Object?> get props => [];
}

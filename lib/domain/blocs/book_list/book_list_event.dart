part of 'book_list_bloc.dart';

abstract class BookListEvent extends Equatable{}

class LoadBookList extends BookListEvent {
  LoadBookList({this.completer});

  final Completer? completer;
  
  @override
  List<Object?> get props => [completer];
}
part of 'book_list_bloc.dart';

abstract class BookListState extends Equatable{}

class BookListInitial extends BookListState {
  @override
  List<Object?> get props => [];
}

class BookListLoading extends BookListState{
  @override
  List<Object?> get props => [];
}

class BookListLoaded extends BookListState{
  BookListLoaded({required this.bookList});

  final List<Book> bookList;
  
  @override
  List<Object?> get props => [bookList];
}

class BookListLoadingFail extends BookListState{
  BookListLoadingFail({this.exception});

  final Object? exception;
  
  @override
  List<Object?> get props => [exception];
}

class BookAdded extends BookListState{
  @override
  List<Object?> get props => [];
}

class BookAdding extends BookListState{
  @override
  List<Object?> get props => [];
}

class BookAddingFail extends BookListState{
  BookAddingFail({required this.exception});
  
  final Object? exception;

  @override
  List<Object?> get props => [];
}

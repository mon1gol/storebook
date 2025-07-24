import 'package:storebook/data/models/book.dart';

abstract class AbstractBookRepository {
  Future<List<Book>> getBooksList();
  Future<List<Book>> getBooksBySearch(String searchParam);
}

abstract class AbstractLocalBookRepository{
  Future<Book> addBook(Book book);
  Future<void> removeBook(String bookId);
  Future<bool> isFavorite(String bookId);
  Future<List<Book>> getFavorites();
}
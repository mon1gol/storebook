import 'package:storebook/data/models/book.dart';

abstract class AbstractBookRepository {
  Future<List<Book>> getBooksList();
  Future<List<Book>> getBooksBySearch(String searchParam);
}
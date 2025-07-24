import 'package:hive_flutter/adapters.dart';
import 'package:storebook/data/models/book.dart';
import 'package:storebook/data/repositories/index.dart';

class BookFavoritesRepository implements AbstractLocalBookRepository {
  BookFavoritesRepository({
    required this.favoritesBox,
  });
  
  final Box<Book> favoritesBox;

  @override
  Future<Book> addBook(Book book) async {
    await favoritesBox.put(book.title, book);
    return book;
  }

  @override
  Future<List<Book>> getFavorites() async {
    final favoritesBoxList = favoritesBox.values.toList();
    return favoritesBoxList;
  }

  @override
  Future<bool> isFavorite(String bookId) async {
    // TODO: implement isFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> removeBook(String bookId) async {
    // TODO: implement removeBook
    throw UnimplementedError();
  }
  
}
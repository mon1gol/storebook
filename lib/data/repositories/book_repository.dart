import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:storebook/data/models/book.dart';
import 'package:storebook/data/repositories/index.dart';

class BookRepository implements AbstractBookRepository {
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes?';

  @override
  Future<List<Book>> getBooksList() async {
    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: {'q': '*', 'orderBy': 'newest', 'maxResults': '20'},
      );

      final response = await Dio().get(uri.toString());

      final items = response.data['items'] as List<dynamic>? ?? [];

      List<Book> bookList = parseBook(items);

      return bookList;
    } catch (e, stackTrace) {
      debugPrint('BookRepository - getBooksList error: $e\n$stackTrace');
      throw Exception('Ошибка загрузки книг: $e');
    }
  }

  @override
  Future<List<Book>> getBooksBySearch(searchParam) async {
    try {
      // Подчищаем ввод: убираем лишние пробелы
      final query = searchParam.trim();

      // Формируем запрос к API
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: {
          'q': 'intitle:$query+OR+inauthor:$query+OR+isbn:$query',
          'maxResults': '20',
        },
      );

      final response = await Dio().get(uri.toString());

      final items = response.data?['items'] as List<dynamic>? ?? [];
      final List<Book> bookList = parseBook(items);

      return bookList;
    } catch (e, stackTrace) {
      debugPrint('BookRepository - getBooksList error: $e\n$stackTrace');
      throw Exception('Ошибка загрузки книг: $e');
    }
  }

  List<Book> parseBook(List<dynamic> items) {
    final bookList = items.map((e) {
      final volumeInfo = e['volumeInfo'] as Map<String, dynamic>;

      return Book(
        id: e['id'],
        title: volumeInfo['title'] ?? 'Без названия',
        authors:
            (volumeInfo['authors'] as List?)?.cast<String>() ??
            ['Автор отсутствует'],
        description: volumeInfo['description'] ?? 'Описание отсутствует',
        thumbnail:
            volumeInfo['imageLinks']?['thumbnail'].replaceFirst(
              'http://',
              'https://',
            ) ??
            volumeInfo['imageLinks']?['smallThumbnail'].replaceFirst(
              'http://',
              'https://',
            ) ??
            '',
      );
    }).toList();
    return bookList;
  }
}

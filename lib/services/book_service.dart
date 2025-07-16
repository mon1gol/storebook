import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:storebook/models/book.dart';

class BookService {
  Future<List<Book>> getBookList() async {
    final apiKey = 'AIzaSyBtPU8LpXihkINUIU2t80py61OqRBgaTRI';

    try {
      final response = await Dio().get(
        'https://www.googleapis.com/books/v1/volumes?q=*&orderBy=newest&maxResults=20&key=$apiKey',
      );

      final items = response.data['items'] as List<dynamic>;
      
      final bookList = items.map((e) {
        final volumeInfo = e['volumeInfo'] as Map<String, dynamic>;

        return Book(
          id: e['id'],
          title: volumeInfo['title'] ?? 'Без названия',
          authors:
              (volumeInfo['authors'] as List?)?.cast<String>() ??
              ['Автор отсутствует'],
          description: volumeInfo['description'] ?? 'Описание отсутствует',
          thumbnail: volumeInfo['imageLinks']?['thumbnail'].replaceFirst('http://', 'https://') ?? volumeInfo['imageLinks']?['smallThumbnail'].replaceFirst('http://', 'https://') ?? '',
        );
      }).toList();

      return bookList;

    } catch (e, stackTrace) {
      debugPrint('BookService - getBookList error: $e\n$stackTrace');
      throw Exception('Ошибка загрузки книг: $e');
    }
  }
}

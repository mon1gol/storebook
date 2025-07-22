import 'package:equatable/equatable.dart';

class Book extends Equatable {
  const Book({
    required this.id,
    required this.title,
    required this.authors,
    this.description = '',
    this.thumbnail = '',
    this.publishedDate = '',
  });

  final String id;
  final String title;
  final List<String> authors;
  final String description;
  final String thumbnail;
  final String publishedDate;

  static List<Book> fromJson(List<dynamic> items) {
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
        publishedDate: volumeInfo['publishedDate'] ?? 'Нет данных о публикации',
      );
    }).toList();
    return bookList;
  }

  @override
  List<Object?> get props => [
    id,
    title,
    authors,
    description,
    thumbnail,
    publishedDate,
  ];
}

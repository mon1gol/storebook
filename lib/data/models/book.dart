import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'book.g.dart';

@HiveType(typeId: 1)
class Book extends Equatable {
  const Book({
    required this.id,
    required this.title,
    required this.authors,
    this.description = '',
    this.thumbnail = '',
    this.publishedDate = '',
    this.isFavorite = false,
  });

  @HiveField(1)
  final String id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final List<String> authors;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String thumbnail;
  @HiveField(6)
  final String publishedDate;
  @HiveField(7)
  final bool isFavorite;

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

  Book copyWith({bool? isFavorite}) {
    return Book(
      id: id,
      title: title,
      authors: authors,
      thumbnail: thumbnail,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    authors,
    description,
    thumbnail,
    publishedDate,
    isFavorite,
  ];
}

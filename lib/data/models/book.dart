import 'package:equatable/equatable.dart';

class Book extends Equatable{
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
  
  @override
  List<Object?> get props => [id, title, authors, description, thumbnail, publishedDate];
}

class Book {
  const Book({
    required this.id,
    required this.title,
    required this.authors,
    this.description,
    this.thumbnail,
  });

  final String id;
  final String title;
  final List<String> authors;
  final String? description;
  final String? thumbnail;
}

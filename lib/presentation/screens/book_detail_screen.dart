import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:storebook/data/models/book.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  String? _bookTitle;
  String? _bookAuthors;
  String? _bookDescription;
  String? _bookThumbnail;
  String? _bookPublishedDate;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as Book;

    _bookTitle = args.title;
    _bookAuthors = args.authors.join(', ');
    _bookDescription = args.description;
    _bookThumbnail = args.thumbnail;
    _bookPublishedDate = args.publishedDate;
    setState(() {});
  
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final fillThumbnail = SvgPicture.asset(
      'assets/svg/home__book.svg',
      height: 256,
      width: 256,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 64),
              Center(
                child: Image.network(
                  _bookThumbnail!,
                  height: 256,
                  width: 256,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return fillThumbnail;
                  },
                ),
              ),
              SizedBox(height: 32),
              Text(
                _bookTitle!,
                style: theme.textTheme.titleLarge, textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                _bookAuthors!,
                style: theme.textTheme.labelLarge, textAlign: TextAlign.center,
              ),
              SizedBox(height: 64),
              Text(
                _bookDescription!,
                style: theme.textTheme.bodyLarge
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Дата публикации: ${_bookPublishedDate!}',
                  style: theme.textTheme.titleMedium
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key, required this.bookTitle, required this.bookSubtitle});

  final String bookTitle;
  final String bookSubtitle;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  String? bookTitle;
  String? bookSubtitle;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    if(args != null && args is String){
      bookTitle = args;
      bookSubtitle = args;
      setState(() {});
    } else {
      return;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(bookTitle ?? '...'),
      ),
    );
  }
}
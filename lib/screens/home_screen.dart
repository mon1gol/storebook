import 'package:flutter/material.dart';
import 'package:storebook/models/book.dart';
import 'package:storebook/services/book_service.dart';
import '../widgets/index.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key, required this.title});

  final String title;

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<Book>? _listBooks;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: (_listBooks == null)
      ? SizedBox()
      : ListView.separated(
          itemCount: _listBooks!.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, i) {
            final title = _listBooks![i].title;
            final subtitle = _listBooks![i].authors;
            final thumbnail = _listBooks![i].thumbnail;
            return ItemsListTile(theme: theme, title: title, subtitle: subtitle.toString(), thumbnail: thumbnail);
          }
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _listBooks = await BookService().getBookList();
          setState(() {});
        },
        child: Icon(Icons.download),
      ),
    );
  }
}
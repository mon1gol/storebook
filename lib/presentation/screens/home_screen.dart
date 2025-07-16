import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:storebook/data/models/book.dart';
import 'package:storebook/data/repositories/index.dart';
import 'package:storebook/presentation/widgets/index.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key, required this.title});

  final String title;

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<Book>? _listBooks;

  @override
  void initState() {
    _getNewestBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: (_listBooks == null)
      ? Center(child: const CircularProgressIndicator())
      : ListView.separated(
          padding: const EdgeInsets.only(top: 16),
          itemCount: _listBooks!.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, i) {
            final title = _listBooks![i].title;
            final subtitle = _listBooks![i].authors.join(', ');
            final thumbnail = _listBooks![i].thumbnail;
            return ItemsListTile(
              theme: theme, 
              title: title, 
              subtitle: subtitle.toString(), 
              thumbnail: thumbnail
            );
          }
        ),
    );
  }

  Future<void> _getNewestBooks() async {
    _listBooks = await GetIt.I<AbstractBookRepository>().getBooksList();
    setState(() {});
  }
}
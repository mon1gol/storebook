import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:storebook/data/repositories/index.dart';
import 'package:storebook/domain/blocs/book_list/book_list_bloc.dart';
import 'package:storebook/presentation/widgets/index.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key, required this.title});

  final String title;

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final _bookListBloc = BookListBloc(
    GetIt.I<AbstractBookRepository>(),
    GetIt.I<AbstractLocalBookRepository>(), 
  );
  String _bookWidgetTitle = '';
  String _bookWidgetSubtitle = '';
  Timer? _searchTimer;

  @override
  void initState() {
    _bookListBloc.add(LoadBookList());
    _bookWidgetTitle = 'Популярные новинки';
    _bookWidgetSubtitle = 'За последнее время';
    super.initState();
  }

  @override
  void dispose(){
    _searchTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: NavigationBarWidget(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: Size(50, 100),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Поиск по названию, автору или ISBN...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (text) async {
                if (text.isEmpty) {
                  return;
                }
                _bookWidgetTitle = 'Результаты поиска';
                _bookWidgetSubtitle = '';
                _searchTimer?.cancel();
                _searchTimer = Timer(Duration(milliseconds: 500), () {
                  _bookListBloc.add(LoadBookListBySearch(searchParam: text));
                });
              },
            ),
          ),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _bookListBloc.add(LoadBookList(completer: completer));
          _bookWidgetTitle = 'Популярные новинки';
          _bookWidgetSubtitle = 'За последнее время';
          return completer.future;
        },
        child: BlocBuilder<BookListBloc, BookListState>(
          bloc: _bookListBloc,

          builder: (context, state) {
            if (state is BookListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.bookList.length,
                separatorBuilder: (context, index) => Divider(),

                itemBuilder: (context, i) {
                  if (i == 0) {
                    return HeaderWidget(
                      title: _bookWidgetTitle,
                      subtitle: _bookWidgetSubtitle,
                      theme: theme,
                    );
                  }
                  return ItemsListTile(
                    theme: theme,
                    book: state.bookList[i - 1],
                    bookListBloc: _bookListBloc,
                    isFavorites: false,
                  );
                },
              );
            }
            if (state is BookListLoadingFail) {
              return LoadErrorWidget(theme: theme, bookListBloc: _bookListBloc);
            }
            if (state is BookListLoading) {
              return Center(child: const CircularProgressIndicator());
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}

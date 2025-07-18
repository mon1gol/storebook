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
  final _bookListBloc = BookListBloc(GetIt.I<AbstractBookRepository>());

  @override
  void initState() {
    _bookListBloc.add(LoadBookList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: Size(50, 100),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Поиск...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (text) {
                if (text.isEmpty) {
                  return;
                }
                Future.delayed(Duration(milliseconds: 500));
                _bookListBloc.add(LoadBookListBySearch(searchParam: text));
              },
            ),
          ),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _bookListBloc.add(LoadBookList(completer: completer));
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
                      title: 'Популярные новинки',
                      subtitle: 'За последнее время',
                      theme: theme,
                    );
                  }
                  return ItemsListTile(
                    theme: theme,
                    book: state.bookList[i - 1],
                  );
                },
              );
            }
            if (state is BookListLoadingFail) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/error__okak.jpg',
                      height: 256,
                      width: 256,
                    ),

                    Text(
                      'Произошла ошибка при загрузке данных',
                      style: theme.textTheme.titleMedium,
                    ),

                    Text(
                      'Проверьте подключение к интернету',
                      style: theme.textTheme.bodyMedium,
                    ),

                    SizedBox(height: 30),

                    FilledButton(
                      onPressed: () {
                        _bookListBloc.add(LoadBookList());
                      },
                      child: const Text('Повторить'),
                    ),
                  ],
                ),
              );
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

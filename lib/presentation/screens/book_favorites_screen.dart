import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:storebook/data/repositories/abstract_book_repository.dart';
import 'package:storebook/presentation/blocs/book_list/book_list_bloc.dart';
import 'package:storebook/presentation/widgets/index.dart';

class BookFavoritesScreen extends StatefulWidget {
  const BookFavoritesScreen({super.key});

  @override
  State<BookFavoritesScreen> createState() => _BookFavoritesScreenState();
}

class _BookFavoritesScreenState extends State<BookFavoritesScreen> {
  final _bookListBloc = BookListBloc(
    GetIt.I<AbstractBookRepository>(),
    GetIt.I<AbstractLocalBookRepository>(),
  );

  @override
  void didChangeDependencies() {
    setState(() {});

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _bookListBloc.add(GetFavorites());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<BookListBloc, BookListState>(
        bloc: _bookListBloc,

        builder: (context, state) {
          if (state is BookListLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: state.bookList.length,
              separatorBuilder: (context, index) => Divider(),

              itemBuilder: (context, i) {
                return ItemsListTile(
                  theme: Theme.of(context),
                  book: state.bookList[i],
                  bookListBloc: _bookListBloc,
                  isFavorites: true,
                );
              },
            );
          }
          if (state is BookListLoadingFail) {
            return LoadErrorWidget(
              theme: Theme.of(context),
              bookListBloc: _bookListBloc,
            );
          }
          if (state is BookListLoading) {
            return Center(child: const CircularProgressIndicator());
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

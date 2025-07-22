import 'package:flutter/material.dart';
import 'package:storebook/domain/blocs/book_list/book_list_bloc.dart';

class LoadErrorWidget extends StatelessWidget {
  const LoadErrorWidget({
    super.key,
    required this.theme,
    required BookListBloc bookListBloc,
  }) : _bookListBloc = bookListBloc;

  final ThemeData theme;
  final BookListBloc _bookListBloc;

  @override
  Widget build(BuildContext context) {
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
}
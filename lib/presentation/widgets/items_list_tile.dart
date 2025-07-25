import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:storebook/data/models/book.dart';
import 'package:storebook/presentation/blocs/book_list/book_list_bloc.dart';

class ItemsListTile extends StatelessWidget {
  const ItemsListTile({super.key, required this.theme, required this.book, required this.bookListBloc, required this.isFavorites});

  final Book book;
  final ThemeData theme;
  final BookListBloc bookListBloc;
  final bool isFavorites;

  @override
  Widget build(BuildContext context) {
    final fillThumbnail = SvgPicture.asset(
      'assets/svg/home__book.svg',
      height: 50,
      width: 50,
    );

    return ListTile(
      title: Text(book.title, style: theme.textTheme.titleMedium),
      subtitle: Text(
        book.authors.join(', '),
        style: theme.textTheme.labelLarge,
      ),

      leading: book.thumbnail.isNotEmpty && book.thumbnail != ''
          ? Image.network(
              book.thumbnail,
              height: 50,
              width: 50,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('ItemsListTile error: $error\n$stackTrace');
                return fillThumbnail;
              },
            )
          : fillThumbnail,

      trailing: !isFavorites
      ? IconButton(
        icon: Icon(
          book.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: book.isFavorite ? Colors.red : null,
        ),
        onPressed: () {
          bookListBloc.add(AddBookToFavorites(book: book));
        },
      )
      : null,

      onTap: () {
        Navigator.of(context).pushNamed('/detail', arguments: book);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:storebook/data/models/book.dart';

class ItemsListTile extends StatelessWidget {
  const ItemsListTile({
    super.key, 
    required this.theme,
    required this.book
  });

  final Book book;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final fillThumbnail = SvgPicture.asset(
      'assets/svg/home__book.svg',
      height: 50,
      width: 50,
    );

    return ListTile(
      title: Text(book.title, style: theme.textTheme.titleMedium),
      subtitle: Text(book.authors.join(', '), style: theme.textTheme.labelLarge),

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

      onTap: () {
        Navigator.of(context).pushNamed('/detail', arguments: book);
      },
    );
  }
}

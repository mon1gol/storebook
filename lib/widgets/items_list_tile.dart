import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemsListTile extends StatelessWidget {
  const ItemsListTile({
    super.key,
    required this.theme,
    required this.title,
    required this.subtitle,
    this.thumbnail = '',
  });

  final ThemeData theme;
  final String title;
  final String subtitle;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    final fillThumbnail = SvgPicture.asset(
      'assets/svg/home__book.svg',
      height: 50,
      width: 50,
    );

    return ListTile(
      // title: Text(
      //   'Бестселлеры',
      //   style: theme.textTheme.titleLarge, textAlign: TextAlign.center,
      // ),
      // subtitle: Text(
      //   "Подобрали для вас",
      //   style: theme.textTheme.bodyLarge, textAlign: TextAlign.center,
      // ),
      title: Text(title, style: theme.textTheme.titleMedium),
      subtitle: Text(subtitle, style: theme.textTheme.bodyMedium),

      leading: thumbnail.isNotEmpty && thumbnail != ''
          ? Image.network(
              thumbnail,
              height: 50,
              width: 50,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('ItemsListTile error: $error\n$stackTrace');
                return fillThumbnail;
              },
            )
          : fillThumbnail,

      onTap: () {
        Navigator.of(context).pushNamed('/detail', arguments: title);
      },
    );
  }
}

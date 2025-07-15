import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemsListTile extends StatelessWidget {
  const ItemsListTile({
    super.key,
    required this.theme,
    required this.index
  });

  final ThemeData theme;
  final num index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title: Text(
      //   'Бестселлеры',
      //   style: theme.textTheme.titleLarge, textAlign: TextAlign.center,
      // ),
      // subtitle: Text(
      //   "Подобрали для вас",
      //   style: theme.textTheme.bodyLarge, textAlign: TextAlign.center,
      // ),
      title: Text(
        'Книга №${index + 1}',
        style: theme.textTheme.titleMedium,
      ),
      subtitle: Text(
        "Автор ${index + 1}",
        style: theme.textTheme.bodyMedium,
      ),
    
      leading: SvgPicture.asset('assets/svg/logo__books.svg', height: 50, width: 50),
    
      onTap: () {
        Navigator.of(context).pushNamed(
          '/detail', 
          arguments: "Книга №${index + 1}", 
        );
      }
    );
  }
}
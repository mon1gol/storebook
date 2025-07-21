import '../screens/index.dart';

final routes = {
  '/' :(context) => const BookListScreen(title: 'Книжная Лавка'),
  '/detail' :(context) => const BookDetailScreen(),
  '/favorites' :(context) => const BookFavoritesScreen(),
};
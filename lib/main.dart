import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const StoreBookApp());
}

class StoreBookApp extends StatelessWidget {
  const StoreBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Book App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFADC178),),
        primaryColor: Color(0xFFF0EAD2),

        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFA98467)),
          bodyMedium: TextStyle(color: Color(0xFFA98467)),
          bodySmall: TextStyle(color: Color(0xFFA98467)),
          titleLarge: TextStyle(color: Color.fromARGB(255, 72, 59, 51), fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: Color.fromARGB(255, 72, 59, 51), fontWeight: FontWeight.bold),
          titleSmall: TextStyle(color: Color.fromARGB(255, 72, 59, 51), fontWeight: FontWeight.bold),
        ),

        dividerColor: Color(0xFFDDE5B6),
        scaffoldBackgroundColor: Color(0xFFF0EAD2),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF0EAD2),
          foregroundColor: Color.fromARGB(255, 72, 59, 51),
          centerTitle: true
        ),
      
      ),

      home: const BookListScreen(title: 'Книжная Лавка'),
    );
  }
}

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key, required this.title});

  final String title;

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) => ListTile(
          // title: Text(
          //   'Бестселлеры',
          //   style: theme.textTheme.titleLarge, textAlign: TextAlign.center,
          // ),
          // subtitle: Text(
          //   "Подобрали для вас",
          //   style: theme.textTheme.bodyLarge, textAlign: TextAlign.center,
          // ),
          title: Text(
            'Книга №${i + 1}',
            style: theme.textTheme.titleMedium,
          ),
          subtitle: Text(
            "Автор ${i + 1}",
            style: theme.textTheme.bodyMedium,
          ),

          leading: SvgPicture.asset('assets/svg/logo__books.svg', height: 50, width: 50),

          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:(context) => BookDetailScreen(bookTitle: 'Книга №${i + 1}', bookSubtitle: 'Автор ${i + 1}',),
              )
            );
          }
        ),
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.bookTitle, required this.bookSubtitle});

  final String bookTitle;
  final String bookSubtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(bookTitle),
      ),
    );
  }
}
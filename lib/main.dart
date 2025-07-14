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

      home: const MyHomePage(title: 'Книжная Лавка'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            "Подобрали для вас",
            style: theme.textTheme.bodyMedium,
          ),

          leading: SvgPicture.asset('assets/svg/logo__books.svg', height: 50, width: 50),
        ),
      ),
    );
  }
}

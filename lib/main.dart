import 'package:flutter/material.dart';

void main() {
  runApp(const StoreBookApp());
}

class StoreBookApp extends StatelessWidget {
  const StoreBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFADC178),),
        primaryColor: Color(0xFFF0EAD2),

        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFA98467)),
          bodyMedium: TextStyle(color: Color(0xFFA98467)),
          bodySmall: TextStyle(color: Color(0xFFA98467)),
          titleLarge: TextStyle(color: Color.fromARGB(255, 72, 59, 51)),
          titleMedium: TextStyle(color: Color.fromARGB(255, 72, 59, 51)),
          titleSmall: TextStyle(color: Color.fromARGB(255, 72, 59, 51)),
        ),

        dividerColor: Color(0xFFDDE5B6),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF0EAD2),
          foregroundColor: Color.fromARGB(255, 72, 59, 51),
        ),
      
      ),

      home: const MyHomePage(title: 'Store Book'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

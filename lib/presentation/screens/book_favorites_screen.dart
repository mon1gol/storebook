import 'package:flutter/material.dart';

class BookFavoritesScreen extends StatefulWidget {
  const BookFavoritesScreen({super.key});

  @override
  State<BookFavoritesScreen> createState() => _BookFavoritesScreenState();
}

class _BookFavoritesScreenState extends State<BookFavoritesScreen> {
  @override
  void didChangeDependencies() {
    setState(() {});
  
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        
      )
    );
  }
}
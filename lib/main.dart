import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:storebook/app.dart';
import 'package:storebook/data/models/book.dart';
import 'package:storebook/data/repositories/abstract_book_repository.dart';
import 'package:storebook/data/repositories/book_repository.dart';

void main() async {
  GetIt.I.registerLazySingleton<AbstractBookRepository>(() => BookRepository());

  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());

  final favoritesBookBox = await Hive.openBox<Book>('favorites_book_box');

  runApp(const StoreBookApp());
}

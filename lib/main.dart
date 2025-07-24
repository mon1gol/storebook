import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:storebook/app.dart';
import 'package:storebook/data/models/book.dart';
import 'package:storebook/data/repositories/abstract_book_repository.dart';
import 'package:storebook/data/repositories/book_favorites_repository.dart';
import 'package:storebook/data/repositories/book_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(BookAdapter());
  
  const favoritesBookBoxName = 'favorites_book_box';
  final favoritesBookBox = await Hive.openBox<Book>(favoritesBookBoxName);
  
  GetIt.I.registerLazySingleton<AbstractBookRepository>(() => BookRepository());
  GetIt.I.registerLazySingleton<AbstractLocalBookRepository>(
    () => BookFavoritesRepository(favoritesBox: favoritesBookBox)
  );

  runApp(const StoreBookApp());
}

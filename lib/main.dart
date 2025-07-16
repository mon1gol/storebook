import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:storebook/app.dart';
import 'package:storebook/data/repositories/book_repository.dart';

void main() {
  GetIt.I.registerLazySingleton(() => BookRepository());
  runApp(const StoreBookApp());
}

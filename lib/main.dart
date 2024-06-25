import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:maxopen_task/cool_movies.dart';
import 'package:maxopen_task/core/di/get_it.dart' as get_it;
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieAdapter());
  runApp(const CoolMovies());
}

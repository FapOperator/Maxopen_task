import 'package:flutter/material.dart';
import 'package:maxopen_task/cool_movies.dart';
import 'package:maxopen_task/di/get_it.dart' as get_it;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();
  runApp(const CoolMovies());
}

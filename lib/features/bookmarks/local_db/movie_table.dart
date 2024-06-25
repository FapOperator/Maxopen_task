import 'package:hive/hive.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
  });
  //  : super(
  //         id: id,
  //         title: title,
  //         posterPath: posterPath,
  //         backdropPath: '',
  //         releaseDate: '',
  //         voteAverage: 0,
  //       );
}

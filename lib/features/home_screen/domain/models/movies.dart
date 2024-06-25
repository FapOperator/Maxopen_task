// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 0)
class Movie {
  @HiveField(2)
  final String? posterPath;
  @HiveField(3)
  final String overview;
  @HiveField(4)
  final List<int> genreIds;
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(5)
  final String? backdropPath;
  @HiveField(6)
  final double voteAverage;

  Movie({
    required this.posterPath,
    required this.overview,
    required this.genreIds,
    required this.id,
    required this.title,
    this.backdropPath,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';

part 'top_five_movies.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TopFiveMoviesResponce {
  final int page;
  @JsonKey(
    name: 'results',
  )
  final List<Movie> movies;
  final int totalResults;
  final int totalPages;
  TopFiveMoviesResponce({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });
  factory TopFiveMoviesResponce.fromJson(Map<String, dynamic> json) =>
      _$TopFiveMoviesResponceFromJson(json);
  Map<String, dynamic> toJson() => _$TopFiveMoviesResponceToJson(this);
}

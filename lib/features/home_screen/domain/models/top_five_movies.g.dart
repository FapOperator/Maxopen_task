// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_five_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopFiveMoviesResponce _$TopFiveMoviesResponceFromJson(
        Map<String, dynamic> json) =>
    TopFiveMoviesResponce(
      page: (json['page'] as num).toInt(),
      movies: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['total_results'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$TopFiveMoviesResponceToJson(
        TopFiveMoviesResponce instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };

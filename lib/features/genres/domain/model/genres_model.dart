import 'package:json_annotation/json_annotation.dart';

part 'genres_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenresModel {
  final int id;
  final String name;

  GenresModel({
    required this.id,
    required this.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      _$GenresModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenresModelToJson(this);
}

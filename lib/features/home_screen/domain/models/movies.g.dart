// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      posterPath: fields[2] as String?,
      overview: fields[3] as String,
      genreIds: (fields[4] as List).cast<int>(),
      id: fields[0] as int,
      title: fields[1] as String,
      backdropPath: fields[5] as String?,
      voteAverage: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(7)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.genreIds)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.backdropPath)
      ..writeByte(6)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      posterPath: json['poster_path'] as String?,
      overview: json['overview'] as String,
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
    };

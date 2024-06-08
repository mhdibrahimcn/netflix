// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_drama_genre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDramaGenreModel _$HomeDramaGenreModelFromJson(Map<String, dynamic> json) =>
    HomeDramaGenreModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  HomeDramaGenreResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeDramaGenreModelToJson(
        HomeDramaGenreModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

HomeDramaGenreResult _$HomeDramaGenreResultFromJson(
        Map<String, dynamic> json) =>
    HomeDramaGenreResult(
      id: (json['id'] as num?)?.toInt(),
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$HomeDramaGenreResultToJson(
        HomeDramaGenreResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
    };

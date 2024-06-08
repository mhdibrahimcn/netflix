// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_tv_shows_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeTvShowsModel _$HomeTvShowsModelFromJson(Map<String, dynamic> json) =>
    HomeTvShowsModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => HomeTvShowResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeTvShowsModelToJson(HomeTvShowsModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

HomeTvShowResult _$HomeTvShowResultFromJson(Map<String, dynamic> json) =>
    HomeTvShowResult(
      id: (json['id'] as num?)?.toInt(),
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$HomeTvShowResultToJson(HomeTvShowResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
    };

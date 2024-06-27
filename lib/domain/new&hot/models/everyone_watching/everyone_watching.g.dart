// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'everyone_watching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EveryoneWatchingModel _$EveryoneWatchingModelFromJson(
        Map<String, dynamic> json) =>
    EveryoneWatchingModel(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map(
              (e) => EveryoneWatchingResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EveryoneWatchingModelToJson(
        EveryoneWatchingModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

EveryoneWatchingResult _$EveryoneWatchingResultFromJson(
        Map<String, dynamic> json) =>
    EveryoneWatchingResult(
      backdropPath: json['backdrop_path'] as String?,
      id: (json['id'] as num?)?.toInt(),
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EveryoneWatchingResultToJson(
        EveryoneWatchingResult instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'name': instance.name,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBgModel _$HomeBgModelFromJson(Map<String, dynamic> json) => HomeBgModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => HomeResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeBgModelToJson(HomeBgModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

HomeResultData _$HomeResultDataFromJson(Map<String, dynamic> json) =>
    HomeResultData(
      id: (json['id'] as num?)?.toInt(),
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$HomeResultDataToJson(HomeResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
    };

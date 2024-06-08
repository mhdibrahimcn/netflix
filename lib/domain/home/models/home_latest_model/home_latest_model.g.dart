// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_latest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeLatestModel _$HomeLatestModelFromJson(Map<String, dynamic> json) =>
    HomeLatestModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  HomeLatestResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeLatestModelToJson(HomeLatestModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

HomeLatestResultData _$HomeLatestResultDataFromJson(
        Map<String, dynamic> json) =>
    HomeLatestResultData(
      id: (json['id'] as num?)?.toInt(),
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$HomeLatestResultDataToJson(
        HomeLatestResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
    };

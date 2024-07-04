// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => SearchResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SearchResultData _$SearchResultDataFromJson(Map<String, dynamic> json) =>
    SearchResultData(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      posterPath: json['poster_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    )
      ..releaseDate = json['release_date'] as String?
      ..voteAverage = (json['vote_average'] as num?)?.toDouble()
      ..originalLanguage = json['original_language'] as String?
      ..overview = json['overview'] as String?;

Map<String, dynamic> _$SearchResultDataToJson(SearchResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'genre_ids': instance.genreIds,
      'vote_average': instance.voteAverage,
      'original_language': instance.originalLanguage,
      'overview': instance.overview,
    };

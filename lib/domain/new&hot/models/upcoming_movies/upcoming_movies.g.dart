// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMoviesModel _$UpcomingMoviesModelFromJson(Map<String, dynamic> json) =>
    UpcomingMoviesModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  UpcomingMovieResults.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UpcomingMoviesModelToJson(
        UpcomingMoviesModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

UpcomingMovieResults _$UpcomingMovieResultsFromJson(
        Map<String, dynamic> json) =>
    UpcomingMovieResults(
      backdropPath: json['backdrop_path'] as String?,
      id: (json['id'] as num?)?.toInt(),
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$UpcomingMovieResultsToJson(
        UpcomingMovieResults instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
    };

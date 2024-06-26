import 'package:json_annotation/json_annotation.dart';

part 'upcoming_movies.g.dart';

@JsonSerializable()
class UpcomingMoviesModel {
  List<UpcomingMovieResults> results;

  UpcomingMoviesModel({
    this.results = const [],
  });

  factory UpcomingMoviesModel.fromJson(Map<String, dynamic> json) {
    return _$UpcomingMoviesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpcomingMoviesModelToJson(this);
}

@JsonSerializable()
class UpcomingMovieResults {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;

  UpcomingMovieResults({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory UpcomingMovieResults.fromJson(Map<String, dynamic> json) {
    return _$UpcomingMovieResultsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpcomingMovieResultsToJson(this);
}

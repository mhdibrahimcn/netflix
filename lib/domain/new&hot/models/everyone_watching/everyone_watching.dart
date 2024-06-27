import 'package:json_annotation/json_annotation.dart';

part 'everyone_watching.g.dart';

@JsonSerializable()
class EveryoneWatchingModel {
  int? page;
  List<EveryoneWatchingResult>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  EveryoneWatchingModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory EveryoneWatchingModel.fromJson(Map<String, dynamic> json) {
    return _$EveryoneWatchingModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EveryoneWatchingModelToJson(this);
}

@JsonSerializable()
class EveryoneWatchingResult {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  int? id;
  @JsonKey(name: 'original_name')
  String? originalName;
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  String? name;

  EveryoneWatchingResult({
    this.backdropPath,
    this.id,
    this.originalName,
    this.overview,
    this.posterPath,
    this.name,
  });

  factory EveryoneWatchingResult.fromJson(Map<String, dynamic> json) {
    return _$EveryoneWatchingResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EveryoneWatchingResultToJson(this);
}

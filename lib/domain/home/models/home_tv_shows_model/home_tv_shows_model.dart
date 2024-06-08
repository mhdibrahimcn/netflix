import 'package:json_annotation/json_annotation.dart';

part 'home_tv_shows_model.g.dart';

@JsonSerializable()
class HomeTvShowsModel {
  List<HomeTvShowResult> results;

  HomeTvShowsModel({
    this.results = const [],
  });

  factory HomeTvShowsModel.fromJson(Map<String, dynamic> json) {
    return _$HomeTvShowsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeTvShowsModelToJson(this);
}

@JsonSerializable()
class HomeTvShowResult {
  int? id;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  HomeTvShowResult({
    this.id,
    this.posterPath,
  });

  factory HomeTvShowResult.fromJson(Map<String, dynamic> json) {
    return _$HomeTvShowResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeTvShowResultToJson(this);
}

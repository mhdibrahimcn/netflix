import 'package:json_annotation/json_annotation.dart';

part 'home_drama_genre_model.g.dart';

@JsonSerializable()
class HomeDramaGenreModel {
  List<HomeDramaGenreResult> results;

  HomeDramaGenreModel({
    this.results = const [],
  });

  factory HomeDramaGenreModel.fromJson(Map<String, dynamic> json) {
    return _$HomeDramaGenreModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeDramaGenreModelToJson(this);
}

@JsonSerializable()
class HomeDramaGenreResult {
  int? id;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  HomeDramaGenreResult({
    this.id,
    this.posterPath,
  });

  factory HomeDramaGenreResult.fromJson(Map<String, dynamic> json) {
    return _$HomeDramaGenreResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeDramaGenreResultToJson(this);
}

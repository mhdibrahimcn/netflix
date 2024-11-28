import 'package:json_annotation/json_annotation.dart';

part 'movie_video_model.g.dart';

@JsonSerializable()
class MovieVideoModel {
  int? id;
  List<MovieVideoResultLink> results;

  MovieVideoModel({this.id, this.results = const []});

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) {
    return _$MovieVideoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieVideoModelToJson(this);
}

@JsonSerializable()
class MovieVideoResultLink {
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? id;

  MovieVideoResultLink({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.id,
  });

  factory MovieVideoResultLink.fromJson(Map<String, dynamic> json) {
    return _$MovieVideoResultLinkFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieVideoResultLinkToJson(this);
}

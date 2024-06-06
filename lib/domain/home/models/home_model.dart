import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeBgModel {
  @JsonKey(name: 'results')
  List<HomeResultData> results;

  HomeBgModel({
    this.results = const [],
  });

  factory HomeBgModel.fromJson(Map<String, dynamic> json) =>
      _$HomeBgModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBgModelToJson(this);
}

@JsonSerializable()
class HomeResultData {
  int? id;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  HomeResultData({
    this.id,
    this.posterPath,
  });

  factory HomeResultData.fromJson(Map<String, dynamic> json) {
    return _$HomeResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeResultDataToJson(this);
}

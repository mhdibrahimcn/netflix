import 'package:json_annotation/json_annotation.dart';

part 'home_latest_model.g.dart';

@JsonSerializable()
class HomeLatestModel {
  List<HomeLatestResultData> results;

  HomeLatestModel({
    this.results = const [],
  });

  factory HomeLatestModel.fromJson(Map<String, dynamic> json) {
    return _$HomeLatestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeLatestModelToJson(this);
}

@JsonSerializable()
class HomeLatestResultData {
  int? id;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  HomeLatestResultData({
    this.id,
    this.posterPath,
  });

  factory HomeLatestResultData.fromJson(Map<String, dynamic> json) {
    return _$HomeLatestResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeLatestResultDataToJson(this);
}

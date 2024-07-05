import 'package:json_annotation/json_annotation.dart';

part 'belongs_to_collection.g.dart';

@JsonSerializable()
class BelongsToCollection {
  int? id;
  String? name;
  @JsonKey(name: 'poster_path')
  dynamic posterPath;
  @JsonKey(name: 'backdrop_path')
  dynamic backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return _$BelongsToCollectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}

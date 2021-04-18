import "package:json_annotation/json_annotation.dart";

part 'remote_data_entity.g.dart';

@JsonSerializable()
class RemoteDataEntity {
  @JsonKey(name: "results")
  List<Map<String, dynamic>> values;

  RemoteDataEntity({this.values});

  factory RemoteDataEntity.fromJson(Map<String, dynamic> json) => _$RemoteDataEntityFromJson(json);
}
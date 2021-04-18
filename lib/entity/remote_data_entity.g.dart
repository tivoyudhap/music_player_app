// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDataEntity _$RemoteDataEntityFromJson(Map<String, dynamic> json) {
  return RemoteDataEntity(
    values: (json['results'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
  );
}

Map<String, dynamic> _$RemoteDataEntityToJson(RemoteDataEntity instance) =>
    <String, dynamic>{
      'results': instance.values,
    };

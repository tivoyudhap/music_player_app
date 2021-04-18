// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistEntity _$ArtistEntityFromJson(Map<String, dynamic> json) {
  return ArtistEntity(
    artistName: json['artistName'] as String,
    collectionName: json['collectionName'] as String,
    trackName: json['trackName'] as String,
    artistViewUrl: json['artistViewUrl'] as String,
    collectionViewUrl: json['collectionViewUrl'] as String,
    trackViewUrl: json['trackViewUrl'] as String,
    previewUrl: json['previewUrl'] as String,
    artworkUrl100: json['artworkUrl100'] as String,
    trackTimeMillis: json['trackTimeMillis'] as int,
  );
}

Map<String, dynamic> _$ArtistEntityToJson(ArtistEntity instance) =>
    <String, dynamic>{
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'trackName': instance.trackName,
      'artistViewUrl': instance.artistViewUrl,
      'collectionViewUrl': instance.collectionViewUrl,
      'trackViewUrl': instance.trackViewUrl,
      'previewUrl': instance.previewUrl,
      'artworkUrl100': instance.artworkUrl100,
      'trackTimeMillis': instance.trackTimeMillis,
    };

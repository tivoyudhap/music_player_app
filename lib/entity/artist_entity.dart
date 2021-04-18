import "package:json_annotation/json_annotation.dart";
import 'package:music_player_app/entity/base_remote_entity.dart';

part 'artist_entity.g.dart';

@JsonSerializable()
class ArtistEntity extends BaseRemoteEntity<ArtistEntity> {

	@JsonKey(name: "artistName")
	String artistName;

	@JsonKey(name: "collectionName")
	String collectionName;

	@JsonKey(name: "trackName")
	String trackName;

	@JsonKey(name: "artistViewUrl")
	String artistViewUrl;

	@JsonKey(name: "collectionViewUrl")
	String collectionViewUrl;

	@JsonKey(name: "trackViewUrl")
	String trackViewUrl;

	@JsonKey(name: "previewUrl")
	String previewUrl;

	@JsonKey(name: "artworkUrl100")
	String artworkUrl100;

	@JsonKey(name: "trackTimeMillis")
	int trackTimeMillis;

	ArtistEntity({
      this.artistName,
      this.collectionName,
      this.trackName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl100,
      this.trackTimeMillis
	});

  @override
  ArtistEntity fromJsonToEntity(Map<String, dynamic> json) => _$ArtistEntityFromJson(json);

  factory ArtistEntity.fromJson(Map<String, dynamic> json) => _$ArtistEntityFromJson(json);
}

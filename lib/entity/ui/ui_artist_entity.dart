import 'package:music_player_app/entity/artist_entity.dart';

class UIArtistEntity {

  String artistName;
  String collectionName;
  String trackName;
  String artistViewUrl;
  String trackViewUrl;
  String previewUrl;
  String artworkUrl100;
  int trackTimeMillis;

  UIArtistEntity(
    this.artistName,
    this.collectionName,
    this.trackName,
    this.artistViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl100,
    this.trackTimeMillis);

  factory UIArtistEntity.fromRemote(ArtistEntity entity) {
    return UIArtistEntity(
        entity.artistName,
        entity.collectionName,
        entity.trackName,
        entity.artistViewUrl,
        entity.trackViewUrl,
        entity.previewUrl,
        entity.artworkUrl100,
        entity.trackTimeMillis);
  }
}
import 'package:music_player_app/base/base_entity_mapper.dart';
import 'package:music_player_app/entity/artist_entity.dart';
import 'package:music_player_app/entity/ui/ui_artist_entity.dart';

class ArtistMapper extends BaseEntityMapper<ArtistEntity, UIArtistEntity> {
  @override
  ArtistEntity mapFromJson(Map<String, dynamic> json) {
    return ArtistEntity.fromJson(json);
  }

  @override
  UIArtistEntity mapToUI(ArtistEntity entity) {
    return UIArtistEntity.fromRemote(entity);
  }
}
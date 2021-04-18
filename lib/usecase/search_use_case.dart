
import 'package:dio/dio.dart';
import 'package:music_player_app/base/base_entity_mapper.dart';
import 'package:music_player_app/entity/artist_entity.dart';
import 'package:music_player_app/entity/remote_data_entity.dart';
import 'package:music_player_app/entity/ui/ui_artist_entity.dart';
import 'package:music_player_app/mapper/artist_mapper.dart';
import 'package:music_player_app/remote/base_remote.dart';
import 'package:music_player_app/usecase/base_remote_list_use_case.dart';

class SearchUseCase extends BaseRemoteListUseCase<ArtistEntity, UIArtistEntity> {

  String searchName = "";
  int limit = 20;

  SearchUseCase(this.searchName);

  @override
  BaseEntityMapper<ArtistEntity, UIArtistEntity> getConverter() => ArtistMapper();

  @override
  Future<RemoteDataEntity> getFuture() => RemoteClient(Dio()).searchArtists(searchName, limit, "music");
}
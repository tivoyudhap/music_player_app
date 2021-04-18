import 'package:music_player_app/base/base_bloc.dart';
import 'package:music_player_app/entity/data_entity.dart';
import 'package:music_player_app/entity/ui/ui_artist_entity.dart';

class LoadDataEvent extends BaseBlocEvent {

  String searchKey = "";

  LoadDataEvent(this.searchKey);

  @override
  List<Object> get props => [searchKey];
}

class PlayerSlideEvent extends BaseBlocEvent {

  double progress = 0;

  PlayerSlideEvent(this.progress);

  @override
  List<Object> get props => [progress];
}

class LoadDataState extends ReturnDataState<UIArtistEntity> {

  LoadDataState(UIDataEntity<UIArtistEntity> entity) : super(entity);

  @override
  List<Object> get props => [];
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player_app/base/base_bloc.dart';
import 'package:music_player_app/entity/data_entity.dart';
import 'package:music_player_app/entity/ui/ui_artist_entity.dart';
import 'package:music_player_app/screen/main_event.dart';
import 'package:music_player_app/usecase/search_use_case.dart';

class MainBloc extends Bloc<BaseBlocEvent, BaseBlocState> {

  List<UIArtistEntity> artistList = List();
  double progress = 0;
  UIArtistEntity selectedArtistEntity;

  MainBloc(BaseBlocState initialState) : super(initialState);

  MainBloc.init(): super(LoadingState());

  @override
  Stream<BaseBlocState> mapEventToState(BaseBlocEvent event) async* {
    if (event is LoadDataEvent) {
      UIDataEntity<List<UIArtistEntity>> response = await SearchUseCase(event.searchKey).execute();
      if (!response.isError) {
        artistList.addAll(response.data);
        yield LoadDataState(UIDataEntity());
      } else {
        yield LoadDataState(UIDataEntity(isError: true, message: response.message));
      }
    } else if (event is PlayerSlideEvent) {
      this.progress = event.progress;
    }
  }
}
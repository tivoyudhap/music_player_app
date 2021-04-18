import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/base/base_bloc.dart';
import 'package:music_player_app/base/base_screen.dart';
import 'package:music_player_app/entity/ui/ui_artist_entity.dart';
import 'package:music_player_app/screen/main_bloc.dart';
import 'package:music_player_app/screen/main_event.dart';

class MainScreenContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music App",
      home: MainScreenStatefulWidget()
    );
  }
}

class MainScreenStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends BaseState<MainBloc, BaseBlocEvent> {

  TextEditingController _searchEditingController = TextEditingController();
  MainBloc _bloc = MainBloc.init();

  @override
  MainBloc get bloc => _bloc;

  @override
  bool get isUseAppBar => false;

  @override
  void initBlocState(BuildContext context, BaseBlocState state) {
    if (state is LoadDataState) {
      if (!state.entity.isError) {
        setState(() { });
      }
    }
  }

  @override
  Widget drawBody() {
    return Container(
      child: Column(
        children: _cardItemCollection()
      ),
    );
  }

  Widget _searchAppBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
      color: Colors.grey,
      child: TextFormField(
          controller: _searchEditingController,
          onChanged: (text) => {
            bloc.add(LoadDataEvent(text))
          },
          decoration: InputDecoration(
              hintText: "Search Artists",
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              labelStyle: TextStyle(
                  color: Colors.white
              )
          )
      )
    );
  }

  List<Widget> _cardItemCollection() {
    List<Widget> list = List();
    list.add(_searchAppBar());
    list.add(_itemList());
    list.add(_bottomMusicPlayer());
    return list;
  }

  Widget _itemList() {
    return Expanded(
      child: ListView.builder(itemBuilder: (context, item) {
        return _cardItem(bloc.artistList[item]);
      }, itemCount: bloc.artistList.length)
    );
  }

  Widget _cardItem(UIArtistEntity entity) {
    return GestureDetector(
      onTap: () {
        _onMusicClicked(entity);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(entity.artworkUrl100, width: 125, height: 75, fit: BoxFit.cover,),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(entity.trackName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text(entity.artistName, style: TextStyle(fontSize: 14),),
                        Text(entity.collectionName ?? "-", style: TextStyle(fontSize: 13),)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Divider(height: 1, color: Colors.grey,)
          ],
        )
      ),
    );
  }

  Widget _bottomMusicPlayer() {
    return Container(
      height: 100,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.left_chevron, size: 50,),
              Icon(CupertinoIcons.play_arrow_solid, size: 50,),
              Icon(CupertinoIcons.right_chevron, size: 50,)
            ],
          ),
          Slider(
            max: 100,
            min: 0,
            value: bloc.progress,
            onChanged: (value) {
              setState(() {
                bloc.add(PlayerSlideEvent(value));
              });
            },
          )
        ],
      ),
    );
  }

  void _onMusicClicked(UIArtistEntity entity) {
    bloc.selectedArtistEntity = entity;
    AudioManager.instance.start(bloc.selectedArtistEntity.previewUrl, bloc.selectedArtistEntity.trackName, cover: bloc.selectedArtistEntity.artworkUrl100);
    AudioManager.instance.playOrPause();
  }
}
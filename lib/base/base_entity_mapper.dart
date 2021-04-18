import 'package:music_player_app/entity/base_remote_entity.dart';

abstract class BaseEntityMapper<REMOTE extends BaseRemoteEntity<REMOTE>, UI> {

  BaseEntityMapper();

  UI mapToUI(REMOTE entity);
  REMOTE mapFromJson(Map<String, dynamic> json);

  UI mapToUIFromJson(Map<String, dynamic> json) {
    return mapToUI(mapFromJson(json));
  }

  List<UI> mapListFromRemote(List<REMOTE> list) {
    List<UI> uiList = List();
    list.forEach((element) {
      uiList.add(mapToUI(element));
    });
    return uiList;
  }

  List<UI> mapListFromJson(List<Map<String, dynamic>> jsonList) {
    List<UI> uiList = List();
    List<REMOTE> remoteList = List();
    jsonList.forEach((element) {
      remoteList.add(mapFromJson(element));
    });

    remoteList.forEach((element) {
      uiList.add(mapToUI(element));
    });

    return uiList;
  }
}
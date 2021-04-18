import 'package:dio/dio.dart';
import 'package:music_player_app/base/base_entity_mapper.dart';
import 'package:music_player_app/entity/base_remote_entity.dart';
import 'package:music_player_app/entity/data_entity.dart';
import 'package:music_player_app/entity/remote_data_entity.dart';

abstract class BaseRemoteListUseCase<Remote extends BaseRemoteEntity<Remote>, UI> {

  BaseEntityMapper<BaseRemoteEntity<Remote>, UI> getConverter();

  Future<RemoteDataEntity> getFuture();

  Future<UIDataEntity<List<UI>>> execute() async {
    try {
      RemoteDataEntity remoteEntity = await getFuture();
      return UIDataEntity<List<UI>>(data: getConverter().mapListFromJson(remoteEntity.values));
    } catch (e) {
      if (e is DioError) {
        return UIDataEntity<List<UI>>(isError: true, message: e.message);
      } else {
        return UIDataEntity<List<UI>>(isError: true, message: e.toString());
      }
    }
  }
}
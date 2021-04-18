import 'package:dio/dio.dart';
import 'package:music_player_app/base/base_entity_mapper.dart';
import 'package:music_player_app/entity/base_remote_entity.dart';
import 'package:music_player_app/entity/data_entity.dart';
import 'package:music_player_app/entity/remote_data_entity.dart';

abstract class BaseRemoteDataUseCase<Remote extends BaseRemoteEntity<Remote>, UI> {

  BaseEntityMapper<BaseRemoteEntity<Remote>, UI> getConverter();

  Future<RemoteDataEntity> getFuture();

  Future<UIDataEntity<UI>> execute() async {
    try {
      RemoteDataEntity remoteEntity = await getFuture();
      // return UIDataEntity<UI>(message: "", data: getConverter().mapToUIFromJson(remoteEntity.values));
    } catch (e) {
      if (e is DioError) {
        return UIDataEntity<UI>(isError: true, message: e.message);
      } else {
        return UIDataEntity<UI>(isError: true, message: e.toString());
      }
    }
  }
}
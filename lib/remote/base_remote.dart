import 'package:dio/dio.dart';
import 'package:music_player_app/entity/remote_data_entity.dart';
import 'package:music_player_app/remote/logging_interceptor.dart';
import 'package:retrofit/retrofit.dart';

part 'base_remote.g.dart';

@RestApi(baseUrl: "https://606d405b603ded001750347b.mockapi.io/v1/api")
abstract class RemoteClient {
  factory RemoteClient(Dio dio) {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    dio.options = BaseOptions(receiveTimeout: 10000, connectTimeout: 10000, headers: headers, contentType: "application/json; charset=UTF-8");
    dio.interceptors.add(LoggingInterceptors());

    return _RemoteClient(dio, baseUrl: "https://606d405b603ded001750347b.mockapi.io/v1/api");
  }

  @GET("get")
  Future<RemoteDataEntity> searchArtists(@Query("term") String term, @Query("limit") int limit, @Query("media") String media);
}
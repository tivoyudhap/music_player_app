// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_remote.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RemoteClient implements RemoteClient {
  _RemoteClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://606d405b603ded001750347b.mockapi.io/v1/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<RemoteDataEntity> searchArtists(term, limit, media) async {
    ArgumentError.checkNotNull(term, 'term');
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(media, 'media');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'term': term,
      r'limit': limit,
      r'media': media
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('get',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RemoteDataEntity.fromJson(_result.data);
    return value;
  }
}

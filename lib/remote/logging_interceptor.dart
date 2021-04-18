import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptors extends Interceptor {
  @override
  Future<FutureOr> onRequest(RequestOptions options) async {
    log(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    log("Headers:");
    options.headers.forEach((k, v) => log('$k: $v'));
    if (options.queryParameters != null) {
      log("queryParameters:");
      options.queryParameters.forEach((k, v) => log('$k: $v'));
    }
    if (options.data != null) {
      log("Body: ${options.data}");
    }
    log(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    return options;
  }

  @override
  Future<FutureOr> onError(DioError dioError) async {
    log(
        "<-- ${dioError.message} ${(dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL')}");
    log(
        "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    log("<-- End error");
  }

  @override
  Future<FutureOr> onResponse(Response response) async {
    log(
        "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
    log("Headers:");
    response.headers?.forEach((k, v) => log('$k: $v'));
    log("Response: ${response.data}");
    log("<-- END HTTP");
  }
}
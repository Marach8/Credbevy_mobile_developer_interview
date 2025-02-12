import 'package:credbevy_task/src/global_export.dart';
import 'package:flutter/foundation.dart';

final networkServiceProvider = Provider<NetworkServiceImpl>((_) {
  return NetworkServiceImpl();
});

class NetworkServiceImpl implements NetworkService {
  
  final Dio _dio;
  NetworkServiceImpl() : _dio = Dio() {
    final baseOptions = BaseOptions(
      baseUrl: CredBevyUrls.BASE_URL,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      contentType: 'application/json',
      validateStatus: _validateStatus,
    );
    // set the options

    _dio.options = baseOptions;

    final presetHeaders = <String, String>{
      Headers.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    _dio.options.headers = presetHeaders;
    _dio.interceptors.addAll(
      [
        if (kDebugMode)
          LogInterceptor(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            error: true,
          ),
      ],
    );
  }

  @override
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
      );

      return response;
  }


  @override
  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }


  /// validate the status of a request
  bool _validateStatus(int? status) {
    return status! == 200 || status == 201;
  }
}



extension ResponseExtension on Response {
  bool get isSuccess {
    final is200 = statusCode == HttpStatus.ok;
    final is201 = statusCode == HttpStatus.created;
    return is200 || is201;
  }
}
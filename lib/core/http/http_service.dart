import 'dart:io';

import 'package:dio/dio.dart';

class HttpService {
  final Dio dio;

  HttpService(this.dio);

  Future<Response> get(String url, {Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: headers,
      );

      return response;
    } on DioException catch (exception) {
      if (exception.error.runtimeType == SocketException) {
        throw const SocketException('Falha na conexão');
      } else {
        rethrow;
      }
    } catch (error) {
      rethrow;
    }
  }
}

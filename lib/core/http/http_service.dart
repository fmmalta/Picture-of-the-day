import 'package:dio/dio.dart';

class HttpService {
  final Dio dio;

  HttpService(this.dio);

  Future<Response> get(String url, {Map<String, dynamic>? headers}) async {
    final Response response = await dio.get(
      url,
      queryParameters: headers,
    );

    return response;
  }
}

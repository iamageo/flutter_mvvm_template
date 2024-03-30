import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String patch = "PATCH";
  static const String delete = "DELETE";
}

class HttpManager {
  Future restRequest(
      {required String url,
        required String method,
        Map? headers,
        Map? body}) async {
    final headersDefault = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json'
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(url,
          options: Options(method: method, headers: headersDefault),
          data: body);
      return response.data;
    } on DioException catch (e) {
      return e.response?.data ?? {'error' : e};
    } catch (e) {
      return {'error': e};
    }
  }

}

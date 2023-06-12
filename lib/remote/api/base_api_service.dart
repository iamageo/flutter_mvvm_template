abstract class BaseApiService {

  final String baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url, Map<String, dynamic> jsonBody);

}
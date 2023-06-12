import '../api/api_endpoints.dart';
import '../api/api_service.dart';
import '../api/base_api_service.dart';
import '../model/base_model.dart';
import 'app_repository.dart';

class AppRepositoryImpl implements AppRepository {

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<List<BaseModel>> getDataExample() async {
    try {

      dynamic response = await _apiService.getResponse(ApiEndPoints().getData);

      if (response is List) {
        List<BaseModel> jsonData = response.map((item) => BaseModel.fromJson(item)).toList();
        return jsonData;
      } else {
        throw const FormatException('Received data is not a list');
      }

    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseModel> postDataExample(BaseModel model) async {
    try {
      dynamic response = await _apiService.postResponse(ApiEndPoints().postData, model.toJson());

      if (response.isNotEmpty) {
        BaseModel jsonData = BaseModel.fromJson(response);
        return jsonData;
      } else {
        throw const FormatException('Received data is not in correct format');
      }
    } catch (e) {
      rethrow;
    }
  }

}

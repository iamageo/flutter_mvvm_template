import 'package:dio/dio.dart';
import 'package:flutter_mvvm_template/remote/api/http_manager.dart';
import 'package:flutter_mvvm_template/remote/response/api_response.dart';

import '../api/api_endpoints.dart';
import '../model/base_model.dart';
import 'app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final _httpManager = HttpManager();

  @override
  Future<ApiResponse<List<BaseModel>>> getDataExample() async {
    try {
      dynamic response = await _httpManager.restRequest(
          url: ApiEndPoints().getData, method: HttpMethods.get);

      if (response != null) {
        List<BaseModel> jsonData = List<BaseModel>.from(response.map((item) => BaseModel.fromJson(item)));
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Ocorreu um erro");
      }
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<BaseModel>> postDataExample(BaseModel model) async {
    try {
      dynamic response = await _httpManager.restRequest(
          url: ApiEndPoints().postData,
          body: model.toJson(),
          method: HttpMethods.post);

      if (response != null) {
        BaseModel jsonData = BaseModel.fromJson(response);
        return ApiResponse.success(data: jsonData);
      } else {
        return ApiResponse.error(message: "Ocorreu um erro");
      }
    } catch (e) {
      print(e);
      return ApiResponse.error(message: e.toString());
    }
  }
}

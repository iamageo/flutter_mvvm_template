import 'package:flutter_mvvm_template/remote/model/base_model.dart';
import 'package:flutter_mvvm_template/remote/response/api_response.dart';

abstract class AppRepository {
  Future<ApiResponse<List<BaseModel>>> getDataExample();
  Future<ApiResponse<BaseModel>> postDataExample(BaseModel baseModel);
}
import 'package:flutter_mvvm_template/remote/repository/app_repository.dart';
import 'package:flutter_mvvm_template/remote/repository/app_repository_impl.dart';
import 'package:get/get.dart';

import '../../remote/model/base_model.dart';
import '../../remote/response/api_response.dart';

class ExampleViewModel extends GetxController {

  final AppRepository _api;

  ExampleViewModel({required AppRepository api}) : _api = api;

  Rx<ApiResponse<List<BaseModel>>> getResponse = ApiResponse<List<BaseModel>>.loading().obs;
  Rx<ApiResponse<BaseModel>> postResponse = ApiResponse<BaseModel>.loading().obs;

  Future<void> getPosts() async {

    ApiResponse<List<BaseModel>> result = await _api.getDataExample();

    result.whenOptional(
      success: (list) {
        getResponse.value = ApiResponse.success(data: list);
        update();
      },
      error: (message) {
        getResponse.value = ApiResponse.error(message: message);
      },
    );
  }

  Future<void> sendPost({required BaseModel model}) async {
    postResponse.value = ApiResponse.loading();

    ApiResponse<BaseModel> result = await _api.postDataExample(model);

    result.whenOptional(
      success: (list) {
        postResponse.value = ApiResponse.success(data: list);
        update();
      },
      error: (message) {
        postResponse.value = ApiResponse.error(message: message);
      },
    );
  }

}
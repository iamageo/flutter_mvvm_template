import 'dart:io';

import 'package:flutter_mvvm_template/remote/repository/app_repository_impl.dart';
import 'package:get/get.dart';

import '../remote/exceptions/app_exceptions.dart';
import '../remote/model/base_model.dart';
import '../remote/response/api_response.dart';

class ExampleViewModel extends GetxController {

  final _api = AppRepositoryImpl();

  Rx<ApiResponse<List<BaseModel>>> baseResponse = ApiResponse<List<BaseModel>>.loading().obs;
  Rx<ApiResponse<BaseModel>> postResponse = ApiResponse<BaseModel>.loading().obs;

  void fetchDataFromApi() async {
    _setData(ApiResponse.loading());

    try {
      final data = await _api.getDataExample();
      _setData(ApiResponse.completed(data));
    } on SocketException {
      _setData(ApiResponse.error('No Internet Connection'));
    } on BadRequestException {
      _setData(ApiResponse.error('Bad request'));
    } on UnauthorisedException {
      _setData(ApiResponse.error('Unauthorized'));
    } on FetchDataException {
      _setData(ApiResponse.error('An error occurred while communicating with the server'));
    } catch (e) {
      _setData(ApiResponse.error('An unknown error occurred: ${e.toString()}'));
    }
  }

  void sendDataFromApi(BaseModel baseModel) async {
    _setData(ApiResponse.loading());

    try {
      final data = await _api.postDataExample(baseModel);
      print(data);
      _setPostData(ApiResponse.completed(data));
    } on SocketException {
      _setPostData(ApiResponse.error('No Internet Connection'));
    } on BadRequestException {
      _setPostData(ApiResponse.error('Bad request'));
    } on UnauthorisedException {
      _setPostData(ApiResponse.error('Unauthorized'));
    } on FetchDataException {
      _setPostData(ApiResponse.error('An error occurred while communicating with the server'));
    } catch (e) {
      _setPostData(ApiResponse.error('An unknown error occurred: ${e.toString()}'));
    }
  }

  void _setData(ApiResponse<List<BaseModel>> response) {
    baseResponse.value = response;
  }

  void _setPostData(ApiResponse<BaseModel> response) {
    postResponse.value = response;
  }

}
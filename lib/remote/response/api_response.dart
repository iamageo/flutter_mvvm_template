import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  factory ApiResponse.loading() = Loading;
  factory ApiResponse.success({required T data}) = Success;
  factory ApiResponse.error({required String message}) = Error;
}

extension ApiResponseX<T> on ApiResponse<T> {
  void whenOptional({
    void Function()? loading,
    required void Function(T data) success,
    required void Function(String message) error,
  }) {
    when(
      loading: loading ?? () {},
      success: success,
      error: error,
    );
  }
}

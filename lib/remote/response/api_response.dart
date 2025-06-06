import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.loading() = Loading<T>;
  const factory ApiResponse.success({ required T data }) = Success<T>;
  const factory ApiResponse.error({ required String message }) = Error<T>;
}

extension ApiResponseWhen<T> on ApiResponse<T> {
  R when<R>({
    required R Function() loading,
    required R Function(T data) success,
    required R Function(String message) error,
  }) {
    if (this is Loading<T>) {
      return loading();
    }
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    }
    if (this is Error<T>) {
      return error((this as Error<T>).message);
    }
    throw StateError('Tipo de ApiResponse inesperado');
  }
}


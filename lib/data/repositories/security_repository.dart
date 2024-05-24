import 'package:smarthome/core/di_controller.dart';
import 'package:smarthome/data/data_source/dio/dio_client.dart';
import 'package:smarthome/data/data_source/exception/api_error_handler.dart';
import 'package:smarthome/data/model/base/api_response.dart';
import 'package:smarthome/data/model/security/security_model.dart';
import 'package:smarthome/domain/end_points/end_point.dart';

class SecurityRepository {
  final _dio = sl.get<DioClient>();

  ///
  /// METHOD GET
  ///
  Future<void> getSecurity(
      {required Function(SecurityModel settings) onSuccess,
        required Function(dynamic error) onError}) async {
    try {
      final response = await _dio.get(EndPoints.security);

      onSuccess(SecurityModel.fromJson(response.data as Map<String, dynamic>));
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  ///
  /// METHOD POST
  ///
  Future<void> postSecurity({
    required Data data,
    required Function() onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      await _dio.post(EndPoints.security, data: data.toJson());
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }


  ///
  /// METHOD DELETE
  ///
  Future<void> deleteSecurity({
    required String idSecurity,
    required Function() onSuccess,
    required Function(dynamic error) onError
  }) async {
    try{
      await _dio.delete('${EndPoints.security}/$idSecurity');
      onSuccess();
    }catch(e){
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }
}

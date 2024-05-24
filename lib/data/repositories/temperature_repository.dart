import 'package:smarthome/core/di_controller.dart';
import 'package:smarthome/data/data_source/dio/dio_client.dart';
import 'package:smarthome/data/data_source/exception/api_error_handler.dart';
import 'package:smarthome/data/model/base/api_response.dart';
import 'package:smarthome/data/model/temperature/temperature_model.dart';
import 'package:smarthome/domain/end_points/end_point.dart';

class TempHumidityRepository {
  final _dio = sl.get<DioClient>();

  ///
  /// METHOD GET
  ///
  Future<void> getTempHumidity(
      {required Function(TempModel settings) onSuccess,
        required Function(dynamic error) onError}) async {
    try {
      final response = await _dio.get(EndPoints.temp);

      onSuccess(TempModel.fromJson(response.data as Map<String, dynamic>));
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }
}

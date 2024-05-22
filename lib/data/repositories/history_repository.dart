import 'package:smarthome/core/di_controller.dart';
import 'package:smarthome/data/data_source/dio/dio_client.dart';
import 'package:smarthome/data/data_source/exception/api_error_handler.dart';
import 'package:smarthome/data/model/base/api_response.dart';
import 'package:smarthome/data/model/history/history_model.dart';
import 'package:smarthome/domain/end_points/end_point.dart';

class HistoryRepository {
  final _dio = sl.get<DioClient>();

  ///
  /// METHOD GET
  ///
  Future<void> getHistory(
      {required Function(HistoryModel settings) onSuccess,
        required Function(dynamic error) onError}) async {
    try {
      final response = await _dio.get(EndPoints.history);

      onSuccess(HistoryModel.fromJson(response.data as Map<String, dynamic>));
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }
}

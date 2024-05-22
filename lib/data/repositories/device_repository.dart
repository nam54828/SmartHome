import 'package:smarthome/core/di_controller.dart';
import 'package:smarthome/data/data_source/dio/dio_client.dart';
import 'package:smarthome/data/data_source/exception/api_error_handler.dart';
import 'package:smarthome/data/model/base/api_response.dart';
import 'package:smarthome/data/model/device/device_model.dart';
import 'package:smarthome/domain/end_points/end_point.dart';

class DeviceRepository {
  final _dio = sl.get<DioClient>();

  ///
  /// METHOD GET
  ///
  Future<void> getDevice(
      {required Function(DeviceModel settings) onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      final response = await _dio.get(EndPoints.device);

      onSuccess(DeviceModel.fromJson(response.data as Map<String, dynamic>));
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  ///
  /// METHOD POST
  ///
  Future<void> postDevice({
    required Data data,
    required Function() onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      await _dio.post(EndPoints.device, data: data.toJson());
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  ///
  /// METHOD PUT
  ///
  Future<void> updateDevice(
      {required Data data,
      required String idDevice,
      required Function() onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      await _dio.put('${EndPoints.device}/$idDevice', data: data.toJson());
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }
}

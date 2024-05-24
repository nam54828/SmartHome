import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthome/core/shared_pref/shared_preference_helper.dart';
import 'package:smarthome/data/data_source/dio/dio_client.dart';
import 'package:smarthome/data/data_source/dio/logging_interceptor.dart';
import 'package:smarthome/data/repositories/device_repository.dart';
import 'package:smarthome/data/repositories/history_repository.dart';
import 'package:smarthome/data/repositories/security_repository.dart';
import 'package:smarthome/data/repositories/temperature_repository.dart';

final sl = GetIt.instance;

Future<void> init() async{
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<LoggingInterceptor>(LoggingInterceptor());
  sl.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper(sharedPreferences));
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerLazySingleton<DeviceRepository>(() => DeviceRepository());
  sl.registerLazySingleton<HistoryRepository>(() => HistoryRepository());
  sl.registerLazySingleton<SecurityRepository>(() => SecurityRepository());
  sl.registerLazySingleton<TempHumidityRepository>(() => TempHumidityRepository());
}
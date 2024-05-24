import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthome/data/model/temperature/temperature_model.dart';
import 'package:smarthome/data/repositories/temperature_repository.dart';

class TemperatureController extends GetxController{
  RxList<TempModel> tempModel = <TempModel>[].obs;

  final TempHumidityRepository _tempHumidityRepository = GetIt.I.get<TempHumidityRepository>();
  Future<void> getTemperatureHumidity() async {
    await _tempHumidityRepository.getTempHumidity(
      onSuccess: (data) {
        tempModel.assignAll([data]);
      },
      onError: (error) {
        print("Error fetching devices: $error");
      },
    );
  }

  @override
  void onInit() {
    getTemperatureHumidity();
    super.onInit();
  }

}
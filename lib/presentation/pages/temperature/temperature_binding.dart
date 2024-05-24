import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/temperature/temperature_controller.dart';

class TemperatureBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TemperatureController());
  }
}
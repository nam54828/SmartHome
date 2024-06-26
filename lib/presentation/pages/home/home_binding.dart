import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/temperature/temperature_controller.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TemperatureController());
  }
}
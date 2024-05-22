import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/device/device_controller.dart';

class DeviceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DeviceController());
  }
}
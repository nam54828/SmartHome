import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/setting/setting_controller.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
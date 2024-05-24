import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/security/security_controller.dart';

class SecurityBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SecurityController());
  }
}
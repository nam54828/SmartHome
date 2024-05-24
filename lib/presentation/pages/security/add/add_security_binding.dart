import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/security/add/add_security_controller.dart';

class AddSecurityBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddSecurityController());
  }
}
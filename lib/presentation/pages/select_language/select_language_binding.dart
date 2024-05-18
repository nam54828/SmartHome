import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/select_language/select_language_controller.dart';

class SelectLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectLanguageController>(() => SelectLanguageController());
  }
}

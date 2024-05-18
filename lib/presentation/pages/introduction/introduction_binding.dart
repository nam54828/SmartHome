import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/introduction/introduction_controller.dart';

class IntroductionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => IntroductionController());
  }
}
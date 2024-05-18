import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/voice/voice_controller.dart';

class VoiceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VoiceController());
  }
}
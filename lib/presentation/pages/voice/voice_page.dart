import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smarthome/presentation/pages/voice/voice_controller.dart';
import 'package:smarthome/presentation/pages/voice/widgets/voice_wave_effect.dart';

class VoicePage extends GetView<VoiceController> {
  const VoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Command'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
                height: 300,
                child: Obx(() => VoiceWaveEffect(isListening: controller.isListening.value))),
            Obx(
                  () => Text(
                controller.recognizedText.value,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(height: 16.0),
            Obx(
            () => Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.isListening.value
                        ? null
                        : controller.startListening,
                    child: Text('Start'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: controller.isListening.value
                        ? controller.stopListening
                        : null,
                    child: Text('Stop'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
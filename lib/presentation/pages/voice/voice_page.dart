import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/presentation/pages/voice/voice_controller.dart';
import 'package:smarthome/presentation/pages/voice/widgets/voice_wave_effect.dart';

class VoicePage extends GetView<VoiceController> {
  const VoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Command', style: AppText.text16.copyWith(
          color: ColorResources.PRIMARY_1
        ),),
      ),
      body: Container(
        padding: CustomSizeUtil.setEdgeInsetsAll(CustomSizeUtil.SPACE_4X),
        child: Column(
          children: [
            SizedBox(
                height: 300,
                child: Obx(() => VoiceWaveEffect(
                    isListening: controller.isListening.value))),
            Obx(
              () => Text(
                controller.recognizedText.value,
                style: AppText.text22,
              ),
            ),
            SizedBox(
                height: 15.h
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.isListening.value
                        ? null
                        : controller.startListening,
                    child: Text('Start', style: AppText.text14.copyWith(
                      color: controller.isListening.value ? ColorResources.GREY : ColorResources.PRIMARY_1
                    ),),
                  ),
                  SizedBox(
                      width: 15.w
                  ),
                  ElevatedButton(
                    onPressed: controller.isListening.value
                        ? controller.stopListening
                        : null,
                    child: Text('Stop', style: AppText.text14.copyWith(
                      color: controller.isListening.value ?  ColorResources.PRIMARY_1 : ColorResources.GREY
                    ),),
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

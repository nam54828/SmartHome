import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthome/data/repositories/device_repository.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../data/model/device/device_model.dart';

class VoiceController extends GetxController {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  final recognizedText = Rx<String>('');
  final isListening = RxBool(false);

  final DeviceRepository _deviceRepository = GetIt.I.get<DeviceRepository>();

  RxList<Data> data = <Data>[].obs;

  void updateData(Data newData) {
    final index = data.indexWhere((element) => element.id == newData.id);
    if (index != -1) {
      data[index] = newData;
    }
  }

  Future<void> updateVoice(Data updatedData) async {
    await _deviceRepository.updateDevice(
      data: updatedData,
      idDevice: updatedData.id!,
      onSuccess: () {
        // Handle success
        print('Device updated successfully');
      },
      onError: (error) {
        // Handle error
        print('Error updating device: $error');
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    await _speechToText.initialize();
  }

  void startListening() async {
    isListening.value = true;
    await _speechToText.listen(
      onResult: (result) {
        recognizedText.value = result.recognizedWords;
      },
    );
  }

  void stopListening() async {
    isListening.value = false;
    await _speechToText.stop();

    final matchingData = data.where((item) => item.category.voice.toLowerCase().contains(recognizedText.value.toLowerCase())).toList();

    if (matchingData.isNotEmpty) {
      for (var item in matchingData) {
        final updatedData = item.copyWith(category: item.category.copyWith(status: true));
        updateData(updatedData);
        await updateVoice(updatedData);
      }
    } else {
      final isMatch = data.any((item) => item.category.voice.toLowerCase().contains(recognizedText.value.toLowerCase()));
      if (isMatch) {
        print('Có ít nhất một phần tử khớp');
      } else {
        print('Không có phần tử nào khớp');
      }
    }
  }
}
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceController extends GetxController {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  final recognizedText = Rx<String>('');
  final isListening = RxBool(false);

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
  }
}
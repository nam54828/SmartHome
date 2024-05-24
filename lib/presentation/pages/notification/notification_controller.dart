import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthome/data/repositories/history_repository.dart';

import '../../../data/model/history/history_model.dart';

class NotificationController extends GetxController{
  var tabIndex = 0.obs;
  RxList<Data> categories = <Data>[].obs;
  RxSet<String> displayedNames = <String>{}.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  RxList<HistoryModel> historyModel = <HistoryModel>[].obs;
  RxList<Data> dataModel = <Data>[].obs;
  final Rx<String?> selectedCategory = Rx<String?>(null);

  final Map<int, bool> deviceStatus = {};

  final HistoryRepository _historyRepository = GetIt.I.get<HistoryRepository>();

  Future<void> getAllHistory() async {
    await _historyRepository.getHistory(
      onSuccess: (data) {
        historyModel.assignAll([data]);
      },
      onError: (error) {
        print("Error fetching devices: $error");
      },
    );
  }

  Color getColorFromHex(String hexColor) {
    final processedHexColor = hexColor.replaceAll("#", "");
    return Color(int.parse('0xFF$processedHexColor'));
  }

  int iconCodeFromUnicode(String unicode) {
    String hexCode = unicode.replaceAll('U+', '');
    return int.parse(hexCode, radix: 16);
  }

  Future<void> deleteHistory(String idHistory) async{
    await _historyRepository.deleteHistory(
        idHistory: idHistory,
        onSuccess: (){
          getAllHistory();
          Get.back();
        },
        onError: (_){}
    );
  }

  @override
  void onInit() {
    super.onInit();
    getAllHistory();
  }
}
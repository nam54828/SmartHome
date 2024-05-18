import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthome/data/model/device/device_model.dart';
import 'package:smarthome/data/repositories/device_repository.dart';

class HomeController extends GetxController{
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
  RxList<DeviceModel> deviceModel = <DeviceModel>[].obs;

  final Rx<Data?> selectedCategory = Rx<Data?>(null);


  final DeviceRepository _deviceRepository = GetIt.I.get<DeviceRepository>();

  ///
  ///GET API
  ///
  Future<void> getAllDevice() async {
    await _deviceRepository.getDevice(
        onSuccess: (data) {
          deviceModel.assignAll([data]);
          if (deviceModel.isNotEmpty) {
            selectedCategory.value = deviceModel.first.data!.first;
          }
        },
        onError: (_) {});
  }

  Color getColorFromHex(String hexColor) {
    final processedHexColor = hexColor.replaceAll("#", "");
    return Color(int.parse('0xFF$processedHexColor'));
  }

  @override
  void onInit() {
    getAllDevice();
    super.onInit();
  }
}
import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthome/data/model/device/device_model.dart';
import 'package:smarthome/data/repositories/device_repository.dart';
import 'package:smarthome/data/repositories/temperature_repository.dart';
import 'package:smarthome/presentation/pages/temperature/temperature_controller.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  RxList<Data> categories = <Data>[].obs;
  RxSet<String> displayedNames = <String>{}.obs;

  final tempCtrl = Get.find<TemperatureController>();


  void changeTabIndex(int index) {
    tabIndex.value = index;
  }



  RxList<DeviceModel> deviceModel = <DeviceModel>[].obs;
  RxList<Data> dataModel = <Data>[].obs;
  final Rx<String?> selectedCategory = Rx<String?>(null);

  final Map<int, bool> deviceStatus = {};

  final DeviceRepository _deviceRepository = GetIt.I.get<DeviceRepository>();

  Future<void> getAllDevice() async {
    await _deviceRepository.getDevice(
      onSuccess: (data) {
        deviceModel.assignAll([data]);
        if (deviceModel.isNotEmpty) {
          selectedCategory.value = deviceModel.first.data.first.namecategory;
        }
      },
      onError: (error) {
        print("Error fetching devices: $error");
      },
    );
  }


  Future<void> updateDeviceStatus(Data data, bool newStatus) async {
    data.category.status = newStatus;
    await updateDevice(data);
  }

  Future<void> updateDevice(Data data) async {
    await _deviceRepository.updateDevice(
      data: data,
      idDevice: data.id ?? '',
      onSuccess: () {
        // getAllDevice();
      },
      onError: (error) {
        print("Error updating device: $error");
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



  @override
  void onInit() {
    super.onInit();
    getAllDevice();
    tempCtrl.getTemperatureHumidity();
  }
}

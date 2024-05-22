import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthome/data/model/device/device_model.dart';
import 'package:smarthome/data/repositories/device_repository.dart';
import 'package:smarthome/presentation/pages/home/home_controller.dart';
class DeviceController extends GetxController {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController topicController = TextEditingController();
  final TextEditingController voiceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<Data> data = <Data>[].obs;

  final DeviceRepository _deviceRepository = GetIt.I.get<DeviceRepository>();

  final homeCtrl = Get.find<HomeController>();

  Future<void> addDevice(Data data) async {
    await _deviceRepository.postDevice(
      data: data,
      onSuccess: () {
        homeCtrl.getAllDevice();
        Get.back();
      },
      onError: (_) {},
    );
  }




  @override
  void onClose() {
    categoryNameController.dispose();
    nameController.dispose();
    topicController.dispose();
    voiceController.dispose();
    super.onClose();
  }

  // List of icons to choose from
  List<IconData> iconList = [
    Icons.lightbulb,
    Icons.tv,
    Icons.router,
    Icons.speaker,
    Icons.air,
    Icons.directions_run,
    Icons.local_laundry_service,
    Icons.lock_outline,
    Icons.rss_feed,
    Icons.opacity,
    Icons.garage,
    Icons.local_fire_department_rounded,
    Icons.wb_incandescent_outlined,
    Icons.ac_unit_rounded,
    Icons.restore_from_trash,
  ];

  IconData selectedIcon = Icons.lightbulb;
  bool notification = true;
  Color selectedColor = Color(0xFF7D8869);

  void updateSelectedIcon(IconData icon) {
    selectedIcon = icon;
    update();
  }

  void updateNotification(bool value) {
    notification = value;
    update();
  }

  void updateSelectedColor(Color color) {
    selectedColor = color;
    update();
  }
}

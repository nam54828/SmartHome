import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthome/data/repositories/security_repository.dart';
import 'package:smarthome/presentation/pages/security/security_controller.dart';

import '../../../../data/model/security/security_model.dart';

class AddSecurityController extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController topicController = TextEditingController();
  final TextEditingController primaryPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<Data> data = <Data>[].obs;

  final SecurityRepository _securityRepository = GetIt.I.get<SecurityRepository>();

  late final securityCtrl = Get.find<SecurityController>();


  Future<void> addSecurity(Data data) async {
    await _securityRepository.postSecurity(
      data: data,
      onSuccess: () {
        securityCtrl.getAllDeviceSecurity();
        Get.back();
      },
      onError: (_) {},
    );
  }




  @override
  void onClose() {
    nameController.dispose();
    topicController.dispose();
    primaryPasswordController.dispose();
    super.onClose();
  }
}

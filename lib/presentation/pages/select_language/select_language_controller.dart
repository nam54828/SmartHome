// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:smarthome/config/routes/route_path/auth_routers.dart';
import 'package:smarthome/core/di_controller.dart';
import 'package:smarthome/core/helper/custom_validate.dart';
import 'package:smarthome/core/services/multi_language_service/localization_service.dart';
import 'package:smarthome/core/shared_pref/shared_preference_helper.dart';
import 'package:smarthome/core/utils/images_path.dart';

class SelectLanguageController extends GetxController {
  /// Declare data.
  List<Map<String, dynamic>> multipleLanguages = [
    {
      'value': 'en'.tr,
      'name': 'English',
      'image': ImagesPath.enFlag,
      'valueNumber': 0,
    },
    {
      'value': 'vi'.tr,
      'name': 'Vietnamese',
      'image': ImagesPath.vnFlag,
      'valueNumber': 1,
    },
  ];

  final AutoScrollController scrollController = AutoScrollController(axis: Axis.vertical);

  RxInt languageGroupValue = 0.obs;

  RxBool isFromSetting = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    _getArguments();
    //  Get language default.
    _getLanguageDefault();
  }

  @override
  void onClose() {
    scrollController.dispose();

    isFromSetting.close();

    languageGroupValue.close();

    super.onClose();
  }

  ///
  /// Get arguments.
  ///
  void _getArguments() {
    if (!CustomValidate.nullOrEmpty(Get.arguments)) {
      isFromSetting.value = Get.arguments as bool;
    }
  }

  ///
  /// Get language default.
  ///
  void _getLanguageDefault() {
    languageGroupValue.value = multipleLanguages[multipleLanguages.indexWhere(
            (element) => element['value'].toString() == sl<SharedPreferenceHelper>().getLocale)]['valueNumber'] as int;
    languageGroupValue.refresh();
  }

  ///
  /// On change Language.
  ///
  void onLanguageChange(int val) {
    languageGroupValue.value = val;

    _changeLanguageChange();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.scrollToIndex(
        languageGroupValue.value,
        preferPosition: AutoScrollPosition.middle,
        duration: const Duration(milliseconds: 200),
      );
    });
  }

  ///
  /// On tap go to intro.
  ///
  // void onTapGoToIntro() {
  //   Get.offAllNamed(AuthRouters.INTRODUCTION);
  // }

  ///
  /// On tap go to back
  ///

  void onTapGoToBack(){
    Get.offAllNamed(AuthRouters.DASH_BOARD);
  }

  ///
  /// On select language.
  ///
  void _changeLanguageChange() {
    final _valueLanguage = multipleLanguages[multipleLanguages
        .indexWhere((element) => (element['valueNumber'] as int) == languageGroupValue.value)]['value']
        .toString();

    // Change language.
    LocalizationService.changeLocale(_valueLanguage);
  }

  String getCurrentLanguageName() {
    if (languageGroupValue.value >= 0 &&
        languageGroupValue.value < multipleLanguages.length) {
      return multipleLanguages[languageGroupValue.value]['name'] as String;
    } else {
      return '';
    }
  }

}

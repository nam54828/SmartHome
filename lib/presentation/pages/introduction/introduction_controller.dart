// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/config/routes/route_path/auth_routers.dart';
import 'package:smarthome/core/di_controller.dart';
import 'package:smarthome/core/shared_pref/shared_preference_helper.dart';

class IntroductionController extends GetxController {
  ///
  /// Declare controller.
  final PageController pageController = PageController();

  /// Declare the data.
  RxInt currentPageIndex = 0.obs;


  @override
  void onClose() {
    pageController.dispose();

    // Close Stream.
    currentPageIndex.close();

    super.onClose();
  }

  ///
  /// On change page index.
  ///
  void onChangePageIndex({required int index}) {
    currentPageIndex.value = index;
  }

  ///
  /// Skip intro.
  ///
  void skipIntro() {
    pageController.jumpToPage(2);
  }

  ///
  /// Next page.
  ///
  void nextPage() {
    if (currentPageIndex.value == 2) {
      sl<SharedPreferenceHelper>().setSplash(status: true);
      Get.offAllNamed(AuthRouters.DASH_BOARD);
      return;
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }
}

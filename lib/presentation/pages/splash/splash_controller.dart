import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/config/routes/route_path/auth_routers.dart';
import 'package:smarthome/core/di_controller.dart';
import 'package:smarthome/core/shared_pref/shared_preference_helper.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  ///
  /// Declare API.
  late AnimationController? _animationController;

  AnimationController get animationController => _animationController!;

  @override
  void onInit() {
    super.onInit();

    // check status logged in or not.
    _setStatusLogin();
    // _checkLoginStatus();
  }

  @override
  void onClose() {
    _animationController?.dispose();

    super.onClose();
  }

  ///
  /// check status logged in or not.
  ///
  void _setStatusLogin() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _animationController!.forward().whenComplete(
          () async {
        _onLoginApp();
      },
    );
  }

  ///
  /// On login app.
  ///
  void _onLoginApp() async {
    final sharePreference = sl<SharedPreferenceHelper>();
    final jwtToken = sharePreference.getJwtToken;
    final splash = sharePreference.getSplash;
    final logger = sharePreference.getLogger;
    final isRemember = sharePreference.getRememberAccount;

    if (jwtToken.isEmpty || isRemember == false || !logger) {
      if (splash == false) {
        Get.offAllNamed(AuthRouters.INTRODUCTION);
      } else {
        if(isRemember == false){
          sharePreference.setLogger(idLogger: false);
          Get.offAllNamed(AuthRouters.DASH_BOARD);
        }else{
          Get.toNamed(AuthRouters.DASH_BOARD);
        }
      }
    } else {
      Get.offAllNamed(AuthRouters.DASH_BOARD);
    }
  }


}

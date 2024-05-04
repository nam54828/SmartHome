import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashBoardController extends GetxController {
  RxInt currentIndex = 0.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isBottomAppBarVisible = true.obs;


  void onChangedDashboardPage({
    required int index,
  }) {
    if (index == currentIndex.value) return;
    currentIndex.value = index;
  }


}

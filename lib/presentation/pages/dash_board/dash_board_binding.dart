import 'package:get/get.dart';
import 'package:smarthome/presentation/pages/dash_board/dash_board_controller.dart';
import 'package:smarthome/presentation/pages/home/home_controller.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => HomeController());
  }
}
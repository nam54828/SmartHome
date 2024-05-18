import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/core/base_widget/lazy_index_stack.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';
import 'package:smarthome/presentation/pages/dash_board/dash_board_controller.dart';
import 'package:smarthome/presentation/pages/dash_board/widgets/bottom_bar_widget.dart';
import 'package:smarthome/presentation/pages/dash_board/widgets/custom_bottom_widget.dart';
import 'package:smarthome/presentation/pages/home/home_page.dart';
import 'package:smarthome/presentation/pages/setting/setting_page.dart';
import 'package:smarthome/presentation/pages/voice/voice_page.dart';


class DashBoardPage extends GetView<DashBoardController> {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      key: controller.scaffoldKey,
      backgroundColor: Colors.blue,
      body: Obx(() {
        return LazyIndexedStack(
          index: controller.currentIndex.value,
          children: [const HomePage(), Container(), const VoicePage(), Container(), const SettingPage()],
        );
      }),
      bottomNavigationBar: Obx(
            () => Visibility(
          visible: controller.isBottomAppBarVisible.value,
          child: BottomAppBar(
            color: ColorResources.COLOR_16B978,
            child: _buildBottomNavigationBar(),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BottomBarWidget(
            onTap: () {
              controller.onChangedDashboardPage(index: 0);
            },
            imagePath: ImagesPath.houseIcon,
            isSelected: controller.currentIndex.value == 0),
        BottomBarWidget(
            onTap: () {
              controller.onChangedDashboardPage(index: 1);
            },
            imagePath: ImagesPath.eightSquareIcon,
            isSelected: controller.currentIndex.value == 1),
        CustomBottomBar(
            onTap: () {
              controller.onChangedDashboardPage(index: 2);
            },
            imagePath: ImagesPath.voice_search,
            isSelected: controller.currentIndex.value == 2),
        BottomBarWidget(
            onTap: () {
              controller.onChangedDashboardPage(index: 3);
            },
            imagePath: ImagesPath.notificationIcon,
            isSelected: controller.currentIndex.value == 3),
        BottomBarWidget(
            onTap: () {
              controller.onChangedDashboardPage(index: 4);
            },
            imagePath: ImagesPath.settingIcon,
            isSelected: controller.currentIndex.value == 4),
      ],
    );
  }
}

// ignore_for_file: constant_identifier_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:smarthome/presentation/pages/dash_board/dash_board_binding.dart';
import 'package:smarthome/presentation/pages/dash_board/dash_board_page.dart';

mixin AuthRouters {
  static const String DASH_BOARD = '/dash_board';

  static List<GetPage> listPage = [
    GetPage(
        name: DASH_BOARD,
        page: () => DashBoardPage(),
        binding: DashBoardBinding(),
    ),
  ];
}
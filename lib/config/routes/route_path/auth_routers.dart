// ignore_for_file: constant_identifier_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:smarthome/presentation/pages/dash_board/dash_board_binding.dart';
import 'package:smarthome/presentation/pages/dash_board/dash_board_page.dart';
import 'package:smarthome/presentation/pages/introduction/introduction_binding.dart';
import 'package:smarthome/presentation/pages/introduction/introduction_page.dart';
import 'package:smarthome/presentation/pages/select_language/select_language_binding.dart';
import 'package:smarthome/presentation/pages/select_language/select_language_page.dart';
import 'package:smarthome/presentation/pages/splash/splash_binding.dart';
import 'package:smarthome/presentation/pages/splash/splash_page.dart';

mixin AuthRouters {
  static const String DASH_BOARD = '/dash_board';
  static const String SELECT_LANGUAGE = '/select_language';
  static const String INTRODUCTION = '/introduction';
  static const String SPLASH = '/splash';

  static List<GetPage> listPage = [
    GetPage(
        name: DASH_BOARD,
        page: () => const DashBoardPage(),
        binding: DashBoardBinding(),
    ),
    GetPage(
      name: SELECT_LANGUAGE,
      page: () => const SelectLanguagePage(),
      binding: SelectLanguageBinding(),
    ),
    GetPage(
      name: INTRODUCTION,
      page: () => const IntroductionPage(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
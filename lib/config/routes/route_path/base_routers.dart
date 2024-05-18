import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:smarthome/presentation/pages/setting/setting_binding.dart';
import 'package:smarthome/presentation/pages/setting/setting_page.dart';

mixin BaseRouters {
  static const SETTING = '/settings';

  static List<GetPage> listPage = [
    GetPage(
        name: SETTING,
        page: () => const SettingPage(),
        binding: SettingBinding()
    )
  ];
}
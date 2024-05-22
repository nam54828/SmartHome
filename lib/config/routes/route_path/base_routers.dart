import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:smarthome/presentation/pages/device/device_binding.dart';
import 'package:smarthome/presentation/pages/device/device_page.dart';
import 'package:smarthome/presentation/pages/setting/setting_binding.dart';
import 'package:smarthome/presentation/pages/setting/setting_page.dart';

mixin BaseRouters {
  static const SETTING = '/settings';
  static const DEVICE = '/add_device';

  static List<GetPage> listPage = [
    GetPage(
        name: SETTING,
        page: () => const SettingPage(),
        binding: SettingBinding()
    ),
    GetPage(
        name: DEVICE,
        page: () => const DevicePage(),
        binding: DeviceBinding()
    ),
  ];
}
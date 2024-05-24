import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:smarthome/presentation/pages/device/device_binding.dart';
import 'package:smarthome/presentation/pages/device/device_page.dart';
import 'package:smarthome/presentation/pages/security/add/add_security_binding.dart';
import 'package:smarthome/presentation/pages/security/add/add_security_page.dart';
import 'package:smarthome/presentation/pages/setting/setting_binding.dart';
import 'package:smarthome/presentation/pages/setting/setting_page.dart';

mixin BaseRouters {
  static const SETTING = '/settings';
  static const DEVICE = '/add_device';
  static const ADD_SECURITY = '/add_security';

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
    GetPage(
        name: ADD_SECURITY,
        page: () => const AddSecurityPage(),
        binding: AddSecurityBinding()
    ),
  ];
}
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:smarthome/config/routes/route_path/auth_routers.dart';

mixin AppPages {
  static List<GetPage> list = [
    ...AuthRouters.listPage,
  ];
}
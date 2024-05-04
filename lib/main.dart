import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/config/routes/app_pages.dart';
import 'package:smarthome/config/routes/route_path/auth_routers.dart';
import 'package:smarthome/presentation/pages/dash_board/dash_board_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 800),
      useInheritedMediaQuery: true,
      builder: (context, index) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            initialRoute: AuthRouters.DASH_BOARD,
            initialBinding: DashBoardBinding(),
            defaultTransition: Transition.leftToRight,
            transitionDuration: const Duration(),
            getPages: AppPages.list,
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(
              builder: (context, widget) {
                return Theme(
                  data: ThemeData.light(),
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      boldText: false,
                      textScaler: const TextScaler.linear(1.0),
                    ),
                    child: widget!,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

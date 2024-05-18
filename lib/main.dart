import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/config/routes/app_pages.dart';
import 'package:smarthome/config/routes/route_path/auth_routers.dart';
import 'package:smarthome/core/services/multi_language_service/localization_service.dart';
import 'package:smarthome/core/shared_pref/shared_preference_helper.dart';
import 'package:smarthome/core/utils/app_constants.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'core/di_controller.dart' as di;

DateTime? now;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Get it.
  await di.init();

  /// Instance Easy Loading.
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 1500)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..progressColor = ColorResources.WHITE
    ..backgroundColor = ColorResources.PRIMARY_1
    ..indicatorColor = ColorResources.WHITE
    ..textColor = ColorResources.WHITE
    ..maskColor = Colors.transparent
    ..userInteractions = false
    ..textStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ColorResources.WHITE,
    )
    ..dismissOnTap = false;

  // Set Device Orientation.
  _setOrientation();
  // Run app.
  runApp(const MyApp());
}

///
/// Set Device Orientation.
///
void _setOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
            initialRoute: AuthRouters.SPLASH,
            // initialBinding: DashBoardBinding(),
            defaultTransition: Transition.leftToRight,
            // locale: LocalizationService.locale,
            locale: const Locale('en', 'US'),
            fallbackLocale: LocalizationService.fallbackLocale,
            supportedLocales: LocalizationService.locales,
            translations: LocalizationService(),
            transitionDuration: const Duration(),
            getPages: AppPages.list,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: localizationsDelegates,
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

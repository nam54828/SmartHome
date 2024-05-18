import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/base_widget/base_app_bar.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';
import 'package:smarthome/presentation/pages/select_language/select_language_page.dart';
import 'package:smarthome/presentation/pages/setting/setting_controller.dart';
import 'package:smarthome/presentation/pages/setting/widgets/componet_setting.dart';
class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACK_GROUND,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBody(context),
            Padding(
              padding: const EdgeInsets.all(20),
              child: _buildChooseSetting(context),
            ),
          ],
        ),
      ),
    );
  }


  Positioned _infoUser() {
    return Positioned(
      top: 100.h,
      left: 14.w,
      right: 14.w,
      child: Container(
        width: 282.w,
        height: 97.h,
        decoration: BoxDecoration(
            color: ColorResources.WHITE,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: CustomSizeUtil.setEdgeInsetsOnly(left: 16.w),
              // child: _avatarBorder(controller.user.value.avatar ?? ''),
              child: _avatarBorder(ImagesPath.personIcon),
            ),
            SizedBox(
              width: 14.w,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // controller.user.value.fullName ?? '',
                      // style: AppStyles.text16MediRobo,
                      'Nam'
                    ),
                    Text(
                        // controller.user.value.email ?? '',
                        // style: AppStyles.text16ReguRobo
                      'dnam291002@gmail.com'
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Container _avatarBorder(String imageAvar) {
    // String avatarInitial = controller.user.value.fullName?[0] ?? '';
    return Container(
      width: 64.w,
      height: 64.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 62.w,
          height: 62.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorResources.WHITE,
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: SizedBox(
              width: 60.w,
              height: 60.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: CircleAvatar(
                  child: imageAvar.isEmpty ?
                  Text(
                    // avatarInitial.toUpperCase(),
                    'N',
                    style: TextStyle(fontSize: 24.sp),
                  ) :
                  CustomImage(
                    imageAvar,
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Padding(
            padding: CustomSizeUtil.setEdgeInsetsOnly(
              top: CustomSizeUtil.SPACE_6X
            ),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text('settings'.tr, style: AppText.text18.copyWith(
                  color: ColorResources.MAIN_TITLE
                ),)),
          ),
            Container(
              height: 150.h,
              width: Get.width,
              decoration: BoxDecoration(
                color: ColorResources.COLOR_16B978.withOpacity(0.3)
              ),
            ),
          _infoUser(),
        ],
      ),
    );
  }

  Widget _buildChooseSetting(BuildContext context) {
    return Column(
      children: [
        ComponentSetting(
          icon: ImagesPath.icLanguage,
          title: "change_language".tr,
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const FractionallySizedBox(
                      heightFactor: 0.7, child: SelectLanguagePage());
                }).then((_) {
              Get.updateLocale(Get.locale!);
            });
          },
        ),
        ComponentSetting(
            icon: ImagesPath.privacy,
            title: "privacy".tr,
            onTap: () {
              controller.launchPrivacy();
            }),
        ComponentSetting(
            icon: ImagesPath.support,
            title: "support".tr,
            onTap: () {
              controller.launchPrivacy();
            }),
        ComponentSetting(
          icon: ImagesPath.share,
          title: "share".tr,
          onTap: () {
            controller.shareFriend();
          },
        ),
        ComponentSetting(
            icon: ImagesPath.cancel,
            title: "logout".tr,
            onTap: () {}),
      ],
    );
  }


}

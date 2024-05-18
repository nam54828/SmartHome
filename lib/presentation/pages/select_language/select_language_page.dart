import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/presentation/pages/select_language/select_language_controller.dart';
import 'package:flutter/material.dart';

class SelectLanguagePage extends GetView<SelectLanguageController> {
  const SelectLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: ColorResources.COLOR_F6F6F7,
        body:SizedBox(
          width: CustomSizeUtil.getMaxWidth(),
          height: CustomSizeUtil.getMaxHeight(),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 78.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_AFB0AB,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.h,
                    bottom: 15.h
                ),
                child: Text('change_language'.tr, style: AppText.text16.copyWith(
                    color: ColorResources.PRIMARY_1,
                    fontFamily: 'Inter-SemiBold'
                ),),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView.separated(
                    controller: controller.scrollController,
                    padding: CustomSizeUtil.setEdgeInsetsSymmetric(horizontal: CustomSizeUtil.SPACE_HORIZONTAL_SCREEN),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: controller.multipleLanguages.length,
                    itemBuilder: (context, index) {
                      return _langueCard(index, context);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: CustomSizeUtil.SPACE_2X);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _langueCard(int index, BuildContext context) {
    return Obx(() {
      final languageName = controller.multipleLanguages[index]['name'].toString();
      return AutoScrollTag(
        key: ValueKey(index),
        controller: controller.scrollController,
        index: index,
        child: GestureDetector(
          onTap: () {
            controller.onLanguageChange(index);
            Get.back();
          },
          child: Container(
            padding: CustomSizeUtil.setEdgeInsetsAll(CustomSizeUtil.SPACE_2X),
            width: CustomSizeUtil.getMaxWidth(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorResources.WHITE,
            ),
            child: Row(
              children: [
                Padding(
                  padding: CustomSizeUtil.setEdgeInsetsOnly(right: CustomSizeUtil.SPACE_4X),
                  child: ClipOval(
                    child: CustomImage(
                      controller.multipleLanguages[index]['image'].toString(),
                      width: CustomSizeUtil.setSize(percent: .04),
                      height: CustomSizeUtil.setSize(percent: .04),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    languageName.tr,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorResources.MAIN_TITLE,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: (controller.multipleLanguages[index]['valueNumber'] as int) ==
                      controller.languageGroupValue.value
                      ? CustomSizeUtil.setSize(percent: .0014)
                      : CustomSizeUtil.setSize(percent: .0013),
                  child: Radio<int>(
                    fillColor: MaterialStateProperty.all(ColorResources.PRIMARY_1),
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    value: controller.multipleLanguages[index]['valueNumber'] as int,
                    groupValue: controller.languageGroupValue.value,
                    onChanged: (val) {
                      controller.onLanguageChange(index);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';

class IntroButtonWidget extends StatelessWidget {
  const IntroButtonWidget({
    super.key,
    required this.callBack,
    this.width,
    this.padding,
    this.textStyle,
    required this.isShowStart,
  });

  final Function callBack;
  final double? width;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool isShowStart;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBack();
      },
      child: Container(
        height: Get.context!.isTablet ? 70 : 55,
        width: Get.width,
        padding: CustomSizeUtil.setEdgeInsetsSymmetric(horizontal: CustomSizeUtil.SPACE_4X),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorResources.PRIMARY_1
        ),
        child: Center(
          child: Text(
            isShowStart ? 'intro_07'.tr : 'intro_08'.tr,
            style: textStyle ??
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: ColorResources.WHITE,
                ),
          ),
        ),
      ),
    );
  }
}

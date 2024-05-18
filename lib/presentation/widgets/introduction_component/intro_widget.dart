import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.imagesPath,
  });

  final String title;
  final String subTitle;
  final int index;
  final String imagesPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: CustomSizeUtil.getMaxWidth(),
          child: Padding(
            padding: CustomSizeUtil.setEdgeInsetsAll(
                CustomSizeUtil.SPACE_2X
            ),
            child: Column(
              children: [
                CustomImage(imagesPath, height: 400.h,),
                Text(title, style: AppText.text22.copyWith(
                    color: ColorResources.MAIN_TITLE,
                    fontFamily: 'Inter-ExtraBold',
                    fontWeight: FontWeight.bold
                ),textAlign: TextAlign.center,),
                const SizedBox(
                  height: CustomSizeUtil.SPACE_2X,
                ),
                Text(subTitle, style: AppText.text16.copyWith(
                    color: ColorResources.MAIN_TITLE,
                    fontFamily: 'Inter-Medium'
                ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

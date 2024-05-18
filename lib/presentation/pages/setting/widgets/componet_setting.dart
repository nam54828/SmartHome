import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';

class ComponentSetting extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  const ComponentSetting({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomSizeUtil.setEdgeInsetsOnly(top: CustomSizeUtil.SPACE_2X),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: CustomSizeUtil.getMaxWidth(),
          height: 54,
          decoration: BoxDecoration(
            color: ColorResources.WHITE,
            borderRadius: CustomSizeUtil.setBorderRadiusAll(radius: CustomSizeUtil.SPACE_2X),
          ),
          child: Row(
            children: [
              Padding(
                padding: CustomSizeUtil.setEdgeInsetsOnly(left: CustomSizeUtil.SPACE_5X),
                child: CustomImage(
                  icon,
                  width: 14.86.w,
                  height: 16.66.h,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  title,
                  style: AppText.text16.copyWith(
                      color: ColorResources.MAIN_TITLE,
                      fontFamily: 'Inter-Medium'
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SvgPicture.asset(ImagesPath.angleRight, height: 12.h, width: 8.w,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

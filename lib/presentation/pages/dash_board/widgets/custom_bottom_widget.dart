import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/utils/color_resources.dart';

class CustomBottomBar extends StatefulWidget {
  final VoidCallback onTap;
  final String imagePath;
  final bool isSelected;
  const CustomBottomBar({super.key, required this.onTap, required this.imagePath, required this.isSelected});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0.0, -35.0),
            child: Transform.scale(
              scale: 1.6,
              child: Container(
                height: 70.h,
                width: 70.w,
                decoration: const BoxDecoration(
                  color: ColorResources.BACK_GROUND,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0.0, -35.0),
            child: Transform.scale(
              scale: 1.4,
              child: Container(
                height: 70.h,
                width: 70.w,
                decoration: const BoxDecoration(
                  color: ColorResources.COLOR_16B978,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  child: Transform.scale(
                    scale: 0.7,
                    child: CustomImage(
                      widget.imagePath,
                      width: 40.w,
                      height: 40.h,
                      colorIconsSvg: widget.isSelected
                          ? ColorResources.WHITE
                          : ColorResources.COLOR_071A52,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

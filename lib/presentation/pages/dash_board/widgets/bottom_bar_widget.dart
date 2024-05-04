import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/utils/color_resources.dart';

class BottomBarWidget extends StatefulWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback? onTap;
  const BottomBarWidget({super.key,required this.onTap, required this.imagePath, required this.isSelected, });

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 60.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              widget.imagePath,
              width: 24.w,
              height: 24.h,
              colorIconsSvg:  widget.isSelected
                  ? ColorResources.WHITE
                  : ColorResources.COLOR_071A52,
            ),
          ],
        ),
      ),
    );
  }
}

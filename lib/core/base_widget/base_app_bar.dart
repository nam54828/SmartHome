import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/utils/color_resources.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    this.backgroundColor,
    this.titleStyle,
    this.leading,
    this.bottom,
    this.height = kToolbarHeight,
    this.elevation = 0,
    this.isFlexibleSpace = true,
    this.widgetText,
    this.flexibleSpaceWidget,
    this.centerTitle = true,
  });

  final String title;
  final Widget? leading;
  final Function? onBack;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final PreferredSizeWidget? bottom;
  final double height;
  final double elevation;
  final bool? isFlexibleSpace;
  final Widget? widgetText;
  final Widget? flexibleSpaceWidget;
  final bool? centerTitle;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      elevation: elevation,
      backgroundColor: backgroundColor ?? ColorResources.COLOR_F5F6F8,
      actions: actions,
      foregroundColor: ColorResources.WHITE,
      surfaceTintColor: Colors.transparent,
      leading: leading ??
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
      title: widgetText ??
          Text(
            title,
            style: titleStyle ??
                Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: ColorResources.BLACK,
                ),
          ),
      flexibleSpace: isFlexibleSpace!
          ? flexibleSpaceWidget ??
          Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? ColorResources.BACK_GROUND,
            ),
          )
          : null,
      centerTitle: centerTitle,
    );
  }
}

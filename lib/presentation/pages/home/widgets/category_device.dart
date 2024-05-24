import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';

class CategoryDevice extends StatefulWidget {
  final String text;
  final Color color;
  final Function(bool) onTap;
  final int icon;
  final bool initialSwitchValue;

  CategoryDevice({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    required this.initialSwitchValue,
    required this.icon,
  }) : super(key: key);

  @override
  State<CategoryDevice> createState() => _CategoryDeviceState();
}

class _CategoryDeviceState extends State<CategoryDevice> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.initialSwitchValue;
  }

  @override
  void didUpdateWidget(CategoryDevice oldWidget) {
    super.didUpdateWidget(oldWidget);
    _switchValue =  widget.initialSwitchValue;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      width: 160.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: CustomSizeUtil.SPACE_3X, left: CustomSizeUtil.SPACE_3X),
            child: Row(
              children: [
                Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Icon(
                    IconData(widget.icon, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                SizedBox(
                  width: 45.w,
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                      widget.onTap(value);
                    },
                    activeColor: ColorResources.BLACK,
                    inactiveThumbColor: ColorResources.WHITE,
                    inactiveTrackColor: ColorResources.GREY,
                    activeTrackColor: ColorResources.PRIMARY_1,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: widget.text.length > 10 || widget.text.split('\n').length > 1 ? 0 : 20.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Text(
              widget.text,
              style: AppText.text18.copyWith(
                  color: ColorResources.WHITE, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

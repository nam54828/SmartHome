import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/utils/color_resources.dart';


class DetailsHistoryWidget extends StatefulWidget {
  final String title;
  final String category;
  final String content;
  const DetailsHistoryWidget({
    Key? key,
    required this.title,
    required this.category,
    required this.content,
  }) : super(key: key);

  @override
  State<DetailsHistoryWidget> createState() => _DetailsHistoryWidgetState();
}

class _DetailsHistoryWidgetState extends State<DetailsHistoryWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorResources.WHITE,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.title,
                          style: AppText.text18
                              .copyWith(color: ColorResources.MAIN_TITLE,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Text(
                      widget.category,
                      style: AppText.text12.copyWith(
                        color: ColorResources.PRIMARY_1
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  widget.content,
                  style: AppText.text12.copyWith(
                      color: ColorResources.GREY,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )));
  }
}

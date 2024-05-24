import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';
import 'package:smarthome/presentation/pages/notification/widgets/details_history_widget.dart';

class AlertDialogHistory extends StatefulWidget {
  final Function() onTap;
  final Function()? categoryName;
  final String widgetKey;
  final String title;
  final String category;
  final String content;
  const AlertDialogHistory({
    Key? key,
    required this.onTap,
    this.categoryName,
    required this.widgetKey,
    required this.title,
    required this.category,
    required this.content
  }) : super(key: key);

  @override
  State<AlertDialogHistory> createState() => _AlertDialogHistoryState();
}

class _AlertDialogHistoryState extends State<AlertDialogHistory> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(widget.widgetKey),
        background: Container(
          color: ColorResources.RED,
          child: const Icon(
            Icons.delete,
            color: ColorResources.WHITE,
          ),
        ),
        confirmDismiss: (direction) async {
          final confirmDelete = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                surfaceTintColor: ColorResources.WHITE,
                title: SizedBox(
                    height: 67.h,
                    width: 67.h,
                    child: CustomImage(ImagesPath.deleteDialog, fit: BoxFit.contain,)),
                content: Text(
                  'content_dialog_01'.tr,
                  style: AppText.text15
                      .copyWith(color: ColorResources.MAIN_TITLE,
                      fontFamily: 'Inter-Regular'),
                  textAlign: TextAlign.center,

                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          height: 40.h,
                          width: 115.w,
                          decoration: BoxDecoration(
                              color: ColorResources.WHITE,
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(color: ColorResources.PRIMARY_1)
                          ),
                          child: Center(
                            child: Text("No".tr, style: AppText.text16.copyWith(
                                fontFamily: 'Inter-Regular',
                                color: ColorResources.PRIMARY_1
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      GestureDetector(
                        onTap: (){
                          widget.onTap();
                        },
                        child: Container(
                          height: 40.h,
                          width: 115.w,
                          decoration: BoxDecoration(
                              color: ColorResources.PRIMARY_1,
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(color: ColorResources.PRIMARY_1)
                          ),
                          child: Center(
                            child: Text("Yes".tr, style: AppText.text16.copyWith(
                                fontFamily: 'Inter-Regular',
                                color: ColorResources.WHITE
                            ),),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          );
          return confirmDelete;
        },
        child: Padding(
          padding: CustomSizeUtil.setEdgeInsetsOnly(
              left: CustomSizeUtil.SPACE_4X,
              right: CustomSizeUtil.SPACE_4X,
              bottom: CustomSizeUtil.SPACE_2X),
          child: DetailsHistoryWidget(
              title: widget.title,
              category: widget.category,
              content: widget.content,
         ),
        ));
  }
}

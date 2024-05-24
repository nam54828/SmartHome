import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';
import 'package:smarthome/presentation/pages/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/presentation/pages/notification/widgets/alert_dialog_history.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification", style: AppText.text16.copyWith(
          color: ColorResources.WHITE
        ),),
        centerTitle: true,
        leading: Container(),
        backgroundColor: ColorResources.PRIMARY_1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCategoriesHistory(),
            _buildItemHistory()
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesHistory() {
    return Padding(
      padding: CustomSizeUtil.setEdgeInsetsOnly(
        top: CustomSizeUtil.SPACE_1X,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 30.h,
        ),
        child: Obx(
              () {
            final Set<String> displayedCategories = {};
            final categories = <Widget>[
              ...controller.historyModel.expand((model) {
                return model.data!.map((category) {
                  final categoryName = category.hcategory;
                  if (!displayedCategories.contains(categoryName)) {
                    displayedCategories.add(categoryName!);
                    return _buildCategoryButton(categoryName, categoryName);
                  }
                  return Container();
                }).toList();
              }),
            ];

            if (categories.isNotEmpty) {
              categories.insert(0, _buildCategoryButton(null, 'All'));
            }

            return Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return categories[index];
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String? categoryName, String buttonText) {
    final isSelected = controller.selectedCategory.value == categoryName;
    if (buttonText.length > 10) {
      return Padding(
        padding: CustomSizeUtil.setEdgeInsetsOnly(left: CustomSizeUtil.SPACE_1X),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorResources.PRIMARY_1),
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? ColorResources.PRIMARY_1 : Colors.white,
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                controller.selectedCategory.value = categoryName;
              },
              child: Text(
                buttonText,
                style: AppText.text14.copyWith(
                    color: isSelected ? Colors.white : ColorResources.PRIMARY_1,
                    fontFamily: 'Inter-Medium'),
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          controller.selectedCategory.value = categoryName;
        },
        child: Padding(
          padding: CustomSizeUtil.setEdgeInsetsOnly(left: CustomSizeUtil.SPACE_1X),
          child: Container(
            width: 102.w,
            height: 30.h,
            decoration: BoxDecoration(
              border: Border.all(color: ColorResources.PRIMARY_1),
              borderRadius: BorderRadius.circular(20),
              color: isSelected ? ColorResources.PRIMARY_1 : Colors.white,
            ),
            child: Center(
              child: Text(
                buttonText.toUpperCase(),
                style: AppText.text14.copyWith(
                    color: isSelected ? Colors.white : ColorResources.PRIMARY_1,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );
    }
  }


  Widget _buildItemHistory() {
    return SizedBox(
      height: Get.height,
      child: Obx(() {
        if (controller.selectedCategory.value == null) {
          final allResults =
          controller.historyModel.expand((model) => model.data!).toList();

          if (allResults.isEmpty) {
            return Column(
              children: [
                SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: CustomImage(
                    ImagesPath.no_notification,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'nothing_01'.tr,
                  style: AppText.text14.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorResources.MAIN_TITLE),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'text_page_01'.tr,
                  style: AppText.text14.copyWith(
                      color: ColorResources.GREY),
                ),
              ],
            );
          }
          return ListView.builder(
            itemCount: allResults.length,
            itemBuilder: (context, index) {
              final result = allResults[index];
              return AlertDialogHistory(
                  onTap: (){
                    controller.deleteHistory(result.sId!);
                  },
                  widgetKey: result.hcategory ?? '',
                  title: result.hname ?? '',
                  category: result.hcategory ?? '',
                  content: result.hnotification ?? ''
              );
            },
          );
        } else {
          final filteredResults = controller.historyModel
              .expand((model) => model.data!)
              .where((result) =>
          result.hcategory == controller.selectedCategory.value)
              .toList();

          return ListView.builder(
            itemCount: filteredResults.length,
            itemBuilder: (context, index) {
              final result = filteredResults[index];
              return AlertDialogHistory(
                  onTap: (){
                    controller.deleteHistory(result.sId!);
                  },
                  widgetKey: result.hcategory ?? '',
                  title: result.hname ?? '',
                  category: result.hcategory ?? '',
                  content: result.hnotification ?? ''
              );
            },
          );
        }
      }),
    );
  }


}

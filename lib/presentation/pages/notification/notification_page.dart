import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/presentation/pages/notification/notification_controller.dart';
import 'package:flutter/material.dart';

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
            _buildCategoriesDevice()
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesDevice() {
    return Padding(
      padding: CustomSizeUtil.setEdgeInsetsOnly(
          top: CustomSizeUtil.SPACE_1X,
          bottom: CustomSizeUtil.SPACE_2X
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 30.h,
        ),
        child: Obx(
              () {
            final Set<String> displayedCategories = {};
            final categories = <Widget>[
              ...controller.deviceModel.expand((model) {
                return model.data!.map((category) {
                  final categoryName = category.namecategory;
                  if (!displayedCategories.contains(categoryName)) {
                    displayedCategories.add(categoryName!);
                    return _buildCategoryButton(categoryName, categoryName);
                  }
                  return Container();
                }).toList();
              }),
            ];

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return categories[index];
              },
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
        padding:
        CustomSizeUtil.setEdgeInsetsOnly(left: CustomSizeUtil.SPACE_1X),
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
                buttonText.toUpperCase(),
                style: AppText.text12.copyWith(
                    color: isSelected ? Colors.white : ColorResources.PRIMARY_1,
                    fontWeight: FontWeight.bold
                ),
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
          padding:
          CustomSizeUtil.setEdgeInsetsOnly(left: CustomSizeUtil.SPACE_1X),
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
                style: AppText.text12.copyWith(
                    color: isSelected ? Colors.white : ColorResources.PRIMARY_1,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      );
    }
  }


}

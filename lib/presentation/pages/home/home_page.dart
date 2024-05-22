import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/config/routes/route_path/base_routers.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';
import 'package:smarthome/presentation/pages/home/home_controller.dart';
import 'package:smarthome/presentation/pages/home/widgets/category_device.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              _header(),
              _buildCategoriesDevice(),
              _buildItemDevice()
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: CustomSizeUtil.setEdgeInsetsOnly(top: CustomSizeUtil.SPACE_2X),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                child: CustomImage(ImagesPath.personIcon),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "hello".tr,
                          style: AppText.text24.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorResources.MAIN_TITLE),
                          children: const [
                        TextSpan(text: ", "),
                        TextSpan(text: "DucNam")
                      ])),
                  Text(
                    "welcome".tr,
                    style: AppText.text14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorResources.COLOR_9E9E9E),
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(BaseRouters.DEVICE);
            },
            child: Container(
              height: 74.h,
              width: 56.w,
              decoration: BoxDecoration(
                  color: ColorResources.PRIMARY_1,
                  borderRadius: BorderRadius.circular(16)),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 24,
                  color: ColorResources.COLOR_121212,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: CustomSizeUtil.setEdgeInsetsOnly(top: CustomSizeUtil.SPACE_3X),
      child: Stack(
        children: [
          Container(
            height: 107.h,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorResources.PRIMARY_1.withOpacity(0.46)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "location".tr,
                          style: AppText.text16
                              .copyWith(color: ColorResources.COLOR_454141),
                        ),
                        Text(
                          "VietNam",
                          style: AppText.text12.copyWith(
                            color: ColorResources.COLOR_454141,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                          text: "-10",
                          style: AppText.text30.copyWith(
                              color: ColorResources.WHITE,
                              fontWeight: FontWeight.bold),
                          children: const [TextSpan(text: "°C")]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Partly Clody",
                      style:
                          AppText.text12.copyWith(color: ColorResources.WHITE),
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "H: ",
                              style: AppText.text14.copyWith(
                                  color: ColorResources.WHITE,
                                  fontWeight: FontWeight.bold),
                              children: const [
                                TextSpan(text: "2"),
                                TextSpan(text: "%")
                              ]),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "T: ",
                              style: AppText.text14.copyWith(
                                color: ColorResources.WHITE,
                              ),
                              children: const [
                                TextSpan(text: "-10"),
                                TextSpan(text: "°C")
                              ]),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
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

  Widget _buildItemDevice() {
    return SizedBox(
      height: Get.height,
      child: Obx(() {
        final filteredResults = controller.deviceModel
            .expand((model) => model.data)
            .where((result) => result.namecategory == controller.selectedCategory.value)
            .toList();

        return Wrap(
          spacing: 15.w,
          runSpacing: 15.h,
          children: filteredResults.map((result) {
            return CategoryDevice(
              text: result.category.name,
              initialSwitchValue: result.category.status,
              icon: int.parse(result.category.icon),
              color: controller.getColorFromHex(result.category.color),
              onTap: (newStatus) {
                controller.updateDeviceStatus(result, newStatus);
              },
            );
          }).toList(),
        );
      }),
    );
  }


}

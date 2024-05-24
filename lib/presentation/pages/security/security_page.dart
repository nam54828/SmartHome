import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/config/routes/route_path/base_routers.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';
import 'package:smarthome/presentation/pages/security/security_controller.dart';
import 'package:flutter/material.dart';

class SecurityPage extends GetView<SecurityController> {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACK_GROUND,
      appBar: AppBar(
        title: Text(
          "Security",
          style: AppText.text16.copyWith(color: ColorResources.WHITE),
        ),
        centerTitle: true,
        backgroundColor: ColorResources.PRIMARY_1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: CustomSizeUtil.SPACE_3X
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: const Icon(
                  Icons.tune,
                  color: ColorResources.WHITE,
                ),
                items: <String>[
                  'add_device'.tr
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    Get.toNamed(BaseRouters.ADD_SECURITY);
                  }
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              final filteredResults = controller.securityModel
                  .expand((model) => model.data!)
                  .toList();

              return filteredResults.isEmpty ? _buildNoData() : _buildData();
            })
          ],
        ),
      ),
    );
  }
  Widget _buildData() {
    return SizedBox(
      height: Get.height*0.9,
      child: Obx(() {
        final filteredResults = controller.securityModel
            .expand((model) => model.data!)
            .toList();

        return ListView.builder(
          itemCount: filteredResults.length,
          itemBuilder: (context, index) {
            final result = filteredResults[index];
            return Padding(
              padding: const EdgeInsets.only(
                left: CustomSizeUtil.SPACE_3X,
                right: CustomSizeUtil.SPACE_3X,
                top: CustomSizeUtil.SPACE_2X,
              ),
              child: Container(
                height: 180.h,
                width: Get.width,
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomImage(
                        ImagesPath.security_img,
                        height: 100.h,
                        width: 100.h,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(result.name!, style: AppText.text14.copyWith(
                              color: ColorResources.BLACK,
                              fontWeight: FontWeight.w800
                          ),),
                          Text("Vô hiệu hóa: OFF", style: AppText.text14.copyWith(
                              color: ColorResources.GREY,
                              fontWeight: FontWeight.w800
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
            }),
    );
  }
  Widget _buildNoData() {
    return Column(
      children: [
        Center(
          child: CustomImage(
            ImagesPath.security_img,
            height: 200.h,
            width: 200.h,
          ),
        ),
        Text("nothing_01".tr, style: AppText.text14.copyWith(
          color: ColorResources.BLACK,
          fontWeight: FontWeight.w800
        ),),
        SizedBox(
          height: 15.h,
        ),
        Text("add_device_01".tr , style: AppText.text12.copyWith(
          color: ColorResources.GREY,
          fontWeight: FontWeight.w500
        ),),
        SizedBox(
          height: 15.h,
        ),
        GestureDetector(
          onTap: (){
            Get.toNamed(BaseRouters.ADD_SECURITY);
          },
          child: Container(
            height: 40.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: ColorResources.PRIMARY_1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text("get_go".tr, style: AppText.text12.copyWith(
                color: ColorResources.WHITE,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
        )
      ],
    );
  }

// Widget _buildData(){
//   return Padding(
//     padding: const EdgeInsets.all(24.0),
//     child: Container(
//       height: 180.h,
//       width: Get.width,
//       decoration: BoxDecoration(
//         color: ColorResources.WHITE,
//         borderRadius: BorderRadius.circular(12)
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             CustomImage(
//               ImagesPath.security_img,
//               height: 100.h,
//               width: 100.h,
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Cửa cổng", style: AppText.text14.copyWith(
//                     color: ColorResources.BLACK,
//                     fontWeight: FontWeight.w800
//                 ),),
//                 Text("Vô hiệu hóa: OFF", style: AppText.text14.copyWith(
//                     color: ColorResources.GREY,
//                     fontWeight: FontWeight.w800
//                 ),)
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
}

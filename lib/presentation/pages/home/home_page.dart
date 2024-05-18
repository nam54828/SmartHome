import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/base_widget/custom_image.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';
import 'package:smarthome/presentation/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _appBar(),
              _header()
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(){
    return Padding(
      padding: CustomSizeUtil.setEdgeInsetsOnly(
          top: CustomSizeUtil.SPACE_2X
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                child: CustomImage(
                    ImagesPath.personIcon
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(text: TextSpan(
                    text: "hello".tr,
                      style: AppText.text24.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorResources.MAIN_TITLE
                      ),
                    children: const [
                      TextSpan(
                          text: ", "
                      ),
                      TextSpan(
                        text: "DucNam"
                      )
                    ]
                  )),
                  Text("welcome".tr, style: AppText.text14.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorResources.COLOR_9E9E9E
                  ),)
                ],
              ),
            ],
          ),
          Container(
            height: 74.h,
            width: 56.w,
            decoration: BoxDecoration(
                color: ColorResources.PRIMARY_1,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Center(
              child: Icon(Icons.add, size: 24, color: ColorResources.COLOR_121212,),
            ),
          )
        ],
      ),
    );
  }

  Widget _header(){
    return Padding(padding: CustomSizeUtil.setEdgeInsetsOnly(
      top: CustomSizeUtil.SPACE_3X
    ),
    child: Stack(
      children: [
        Container(
          height: 107.h,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorResources.PRIMARY_1.withOpacity(0.46)
          ),
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
                      Text("location".tr, style: AppText.text16.copyWith(
                          color: ColorResources.COLOR_454141
                      ),),
                      Text("VietNam", style: AppText.text12.copyWith(
                        color: ColorResources.COLOR_454141,
                      ),),
                    ],
                  ),
                  RichText(text: TextSpan(
                      text: "-10",
                      style: AppText.text30.copyWith(
                        color: ColorResources.WHITE,
                        fontWeight: FontWeight.bold
                      ),
                      children: const [
                        TextSpan(
                            text: "°C"
                        )
                      ]
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Partly Clody", style: AppText.text12.copyWith(
                    color: ColorResources.WHITE
                  ),
                  ),
                  Row(
                    children: [
                      RichText(text: TextSpan(
                          text: "H: ",
                          style: AppText.text14.copyWith(
                              color: ColorResources.WHITE,
                              fontWeight: FontWeight.bold
                          ),
                          children: const [
                            TextSpan(
                                text: "2"
                            ),
                            TextSpan(
                                text: "%"
                            )
                          ]
                      ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      RichText(text: TextSpan(
                          text: "T: ",
                          style: AppText.text14.copyWith(
                              color: ColorResources.WHITE,
                          ),
                          children: const [
                            TextSpan(
                                text: "-10"
                            ),
                            TextSpan(
                                text: "°C"
                            )
                          ]
                      ),
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

}

// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/base_widget/lazy_index_stack.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';
import 'package:smarthome/presentation/pages/introduction/introduction_controller.dart';
import 'package:smarthome/presentation/widgets/introduction_component/intro_button_widget.dart';
import 'package:smarthome/presentation/widgets/introduction_component/intro_widget.dart';

class IntroductionPage extends GetView<IntroductionController> {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: GetBuilder(
        init: IntroductionController(),
        builder: (context) {
          return SizedBox(
            width: CustomSizeUtil.getMaxWidth(),
            height: CustomSizeUtil.getMaxHeight(),
            child: Column(
              children: [
                Expanded(
                  child: _bodyIntro(),
                ),
                _dotAndNextButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _bodyIntro() {
    return Column(
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: PageView.builder(
              onPageChanged: (value) {
                controller.onChangePageIndex(index: value);
              },
              controller: controller.pageController,
              physics: const ClampingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return LazyIndexedStack(
                  index: index,
                  children: [
                    IntroWidget(
                      index: index,
                      title: 'onboarding_001'.tr,
                      subTitle: 'onboarding_002'.tr,
                      imagesPath: ImagesPath.onBoarding01,
                    ),
                    IntroWidget(
                      index: index,
                      title: 'onboarding_003'.tr,
                      subTitle: 'onboarding_004'.tr,
                      imagesPath: ImagesPath.onBoarding02,
                    ),
                    IntroWidget(
                      index: index,
                      title: 'onboarding_005'.tr,
                      subTitle: 'onboarding_006'.tr,
                      imagesPath: ImagesPath.onBoarding03,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Padding _dotAndNextButton() {
    return Padding(
      padding: CustomSizeUtil.setEdgeInsetsOnly(
        left: CustomSizeUtil.SPACE_4X,
        right: CustomSizeUtil.SPACE_4X,
        bottom: CustomSizeUtil.SPACE_4X,
      ),
      child: SizedBox(
        height: Get.context!.isTablet ? 100 : 85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ...List.generate(
                  3,
                  (index) {
                    return Obx(() {
                      return Container(
                        margin: EdgeInsets.only(
                            left: index != 0 ? CustomSizeUtil.SPACE_1X : 0),
                        height: 8,
                        width: controller.currentPageIndex.value == index
                            ? 25
                            : 10,
                        decoration: BoxDecoration(
                          color: ColorResources.PRIMARY_1,
                          shape: controller.currentPageIndex.value == index
                              ? BoxShape.rectangle
                              : BoxShape.circle,
                          borderRadius:
                              controller.currentPageIndex.value == index
                                  ? BorderRadius.circular(100)
                                  : null,
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
            Obx(() {
              return IntroButtonWidget(
                callBack: () {
                  controller.nextPage();
                },
                isShowStart: controller.currentPageIndex.value == 2,
              );
            })
          ],
        ),
      ),
    );
  }

}

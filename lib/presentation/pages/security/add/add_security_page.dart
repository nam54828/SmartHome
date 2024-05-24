
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/presentation/pages/device/widgets/custom_text_form_field.dart';
import 'package:smarthome/presentation/pages/security/add/add_security_controller.dart';

import '../../../../data/model/security/security_model.dart';

class AddSecurityPage extends GetView<AddSecurityController> {
  const AddSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.PRIMARY_1,
        title: Text('Add Security', style: AppText.text16.copyWith(
          color: ColorResources.WHITE,
        )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                controller: controller.nameController,
                labelText: 'Name',
                onSave: (value ) {
                  controller.nameController.text = value;
                },

              ),
              CustomTextFormField(
                controller: controller.topicController,
                labelText: 'Topic',
                onSave: (value ) {
                  controller.topicController.text = value;
                },
              ),
              CustomTextFormField(
                controller: controller.primaryPasswordController,
                labelText: 'Password',
                onSave: (value ) {
                  controller.primaryPasswordController.text = value;
                },
              ),

              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Data newData = Data(
                    name: controller.nameController.text,
                    topic: controller.topicController.text,
                    notification: true,
                    primaryPassword: controller.primaryPasswordController.text,
                    password: "123123",
                  );
                  controller.addSecurity(newData);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(ColorResources.PRIMARY_1),
                ),
                child: Text('Add Security', style: AppText.text12.copyWith(
                    color: ColorResources.WHITE
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

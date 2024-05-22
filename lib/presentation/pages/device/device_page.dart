import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/data/model/device/device_model.dart';
import 'package:smarthome/presentation/pages/device/device_controller.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/presentation/pages/device/widgets/custom_text_form_field.dart';

class DevicePage extends GetView<DeviceController> {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.PRIMARY_1,
        title: Text('Add Device', style: AppText.text16.copyWith(
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
                controller: controller.categoryNameController,
                labelText: 'Category Name',
                onSave: (value){
                  controller.categoryNameController.text = value;
                }
              ),
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
                controller: controller.voiceController,
                labelText: 'Voice',
                onSave: (value ) {
                  controller.voiceController.text = value;
                },
              ),

              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  _pickColor(context, controller);
                },
                child: GetBuilder<DeviceController>(
                  builder: (controller) {
                    return Container(
                      height: 50,
                      width: double.infinity,
                      color: controller.selectedColor,
                      child: Center(
                        child: Text(
                            'Pick Color',
                            style: AppText.text12
                        ),
                      ),
                    );
                  },
                ),
              ),
              DropdownButtonFormField<IconData>(
                value: controller.selectedIcon,
                items: controller.iconList.map((IconData icon) {
                  return DropdownMenuItem<IconData>(
                    value: icon,
                    child: Icon(icon),
                  );
                }).toList(),
                onChanged: (IconData? newValue) {
                  if (newValue != null) {
                    controller.updateSelectedIcon(newValue);
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Select Icon',
                  labelStyle: AppText.text16.copyWith(
                      color: ColorResources.GREY
                  ),
                ),
              ),
              SwitchListTile(
                title: Text('Notification', style: AppText.text14),
                value: controller.notification,
                activeColor: ColorResources.BLACK,
                inactiveThumbColor: ColorResources.WHITE,
                inactiveTrackColor: ColorResources.GREY,
                activeTrackColor: ColorResources.PRIMARY_1,
                onChanged: (bool value) {
                  controller.updateNotification(value);
                },
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Category newCategory = Category(
                    name: controller.nameController.text,
                    topic: controller.topicController.text,
                    status: false,
                    color: controller.selectedColor.hex,
                    voice: controller.voiceController.text,
                    notification: controller.notification,
                    time: "23",
                    icon: controller.selectedIcon.codePoint.toString(),
                  );

                  Data newData = Data(
                    category: newCategory,
                    colorcategory:controller.selectedColor.hex,
                    namecategory: controller.categoryNameController.text,
                  );

                  controller.addDevice(newData);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(ColorResources.PRIMARY_1),
                ),
                child: Text('Add Device', style: AppText.text12.copyWith(
                    color: ColorResources.WHITE
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickColor(BuildContext context, DeviceController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pick a color', style: AppText.text18,),
          content: SingleChildScrollView(
            child: ColorPicker(
              color: controller.selectedColor,
              onColorChanged: (Color color) {
                controller.updateSelectedColor(color);
              },
              width: 40.w,
              height: 40.h,
              borderRadius: 8,
              heading: Text(
                'Select color',
                style: AppText.text16
              ),
              subheading: Text(
                'Select color shade',
                style: AppText.text16
              ),
              showMaterialName: true,
              showColorName: true,
              showColorCode: true,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(ColorResources.PRIMARY_1)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Got it', style: AppText.text14.copyWith(
                color: ColorResources.WHITE
              ),),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smarthome/core/helper/app_text.dart';
import 'package:smarthome/core/utils/color_resources.dart';

class CustomTextFormField extends StatefulWidget {
    final TextEditingController controller;
  final String? labelText;
    final void Function(String) onSave;
  const CustomTextFormField({Key? key, required this.controller, this.labelText, required this.onSave}) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onSaved: (value){
              widget.controller.text = value!;
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: AppText.text12.copyWith(
            color: Colors.grey
        ), // Unfocused label color
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorResources.PRIMARY_1), // Underline color when focused
        ),
      ),
    );
  }
}


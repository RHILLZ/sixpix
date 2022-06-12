import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sixpix/controllers/app_controller.dart';
import 'package:sixpix/styles.dart';
import 'package:sizer/sizer.dart';

class TextInput extends GetWidget<AppController> {
  const TextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 5.h,
      child: TextFormField(
        onChanged: (value) => controller.searchQuery = value,
        textAlign: TextAlign.center,
        showCursor: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(.3),
            hintText: 'What do you want to see?',
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: primaryColor.withOpacity(.5))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            contentPadding: const EdgeInsets.all(5)),
      ),
    );
  }
}

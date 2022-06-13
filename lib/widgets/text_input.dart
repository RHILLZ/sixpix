import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sixpix/controllers/app_controller.dart';
import 'package:sixpix/styles.dart';
import 'package:sizer/sizer.dart';

class TextInput extends GetWidget<AppController> {
  TextInput(
      {super.key,
      double? width,
      required String hint,
      Color? color,
      required ValueSetter<String> changeValue})
      : _width = width,
        _hint = hint,
        _color = color,
        _changeValue = changeValue;

  final double? _width;
  final Color? _color;
  final String _hint;
  ValueSetter<String> _changeValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width?.w ?? 80.w,
      height: 5.h,
      child: TextFormField(
        textInputAction: TextInputAction.go,
        onChanged: _changeValue,
        onFieldSubmitted: (value) => controller.search(),
        textAlign: TextAlign.center,
        showCursor: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: _color ?? Colors.white.withOpacity(.3),
            hintText: _hint,
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

import 'package:flutter/material.dart';
import 'package:sixpix/styles.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required Function action,
      required double width,
      required IconData icon,
      required String label})
      : _action = action,
        _icon = icon,
        _width = width,
        _label = label;

  final Function _action;
  final IconData _icon;
  final String _label;
  final double _width;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateProperty.all(secondaryColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
            fixedSize: MaterialStateProperty.all(Size(_width.w, 5.h))),
        onPressed: () => _action(),
        icon: Icon(
          _icon,
          color: primaryColor,
        ),
        label: Text(
          _label,
          style: TextStyle(color: primaryColor, fontSize: 20),
        ));
  }
}

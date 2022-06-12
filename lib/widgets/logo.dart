import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      height: 200,
      width: 200,
    );
  }
}

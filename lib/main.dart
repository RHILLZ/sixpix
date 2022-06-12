import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sixpix/routes/views.dart';
import 'package:sixpix/styles.dart';
import 'package:sixpix/widgets/button.dart';
import 'package:sixpix/widgets/logo.dart';
import 'package:sixpix/widgets/text_input.dart';
import 'package:sizer/sizer.dart';
import 'package:sizer/sizer.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
              title: 'Six Pix',
              theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
              getPages: Views.routes,
              initialRoute: Views.searchView,
            ));
  }
}

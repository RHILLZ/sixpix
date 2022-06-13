import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sixpix/controllers/app_controller.dart';
import 'package:sizer/sizer.dart';

import '../styles.dart';
import '../widgets/widget_exports.dart';

class SearchView extends GetView<AppController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            SizedBox(
              height: 3.h,
            ),
            const Text(
              'Six Pix',
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextInput(
              changeValue: (value) => controller.searchQuery = value,
              hint: 'What are you looking for?',
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomButton(
                action: () => controller.search(),
                width: 40,
                icon: Icons.search,
                label: 'Search')
          ],
        ),
      ),
    );
  }
}

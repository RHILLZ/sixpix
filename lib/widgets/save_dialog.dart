import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sixpix/controllers/app_controller.dart';
import 'package:sixpix/widgets/button.dart';
import 'package:sixpix/widgets/text_input.dart';
import 'package:sizer/sizer.dart';

class SaveDialog extends GetWidget<AppController> {
  const SaveDialog({super.key, required String imageUrl})
      : _imageUrl = imageUrl;
  final String _imageUrl;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Obx(
          () => controller.isProcessing
              ? loader
              : Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextInput(
                        color: Colors.white,
                        width: 60,
                        hint: 'What do you want to name the file?',
                        changeValue: (value) => controller.filename = value),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomButton(
                        action: () async {
                          controller.saveImage(_imageUrl);

                          Get.back();
                        },
                        width: 30,
                        icon: Icons.save_alt,
                        label: 'Save Image')
                  ],
                )),
        ));
  }

  final loader = const Center(
    child: SpinKitFadingGrid(color: Colors.white),
  );
}

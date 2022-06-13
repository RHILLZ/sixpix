import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sixpix/controllers/app_controller.dart';
import 'package:sixpix/styles.dart';
import 'package:sixpix/widgets/button.dart';
import 'package:sixpix/widgets/save_dialog.dart';
import 'package:sixpix/widgets/text_input.dart';
import 'package:sizer/sizer.dart';

class ShowcaseView extends GetView<AppController> {
  ShowcaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Six Pix'),
                const SizedBox(
                  width: 10,
                ),
                logo
              ]),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextInput(
                changeValue: (value) => controller.searchQuery = value,
                hint: 'Looking for..',
                width: 40,
              ),
            )
          ],
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: primaryColor,
        body: Obx(() => controller.isLoading
            ? loader
            : Column(
                children: [
                  Expanded(child: gridview(controller)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                        action: () => controller.next(),
                        width: 30,
                        icon: Icons.chevron_right_rounded,
                        label: '6 more'),
                  )
                ],
              )));
  }

  final loader = const Center(
      child: SpinKitFadingGrid(
    color: Colors.white,
  ));

  final placeholder = SizedBox(
    width: 300,
    height: 300,
    child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: SizedBox()),
  );

  Widget gridview(AppController controller) => GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        controller.images.length,
        (index) => GestureDetector(
          onTap: () => Get.dialog(SaveDialog(
            imageUrl: controller.images[index],
          )),
          child: SizedBox(
              height: 300,
              width: 300,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: controller.images[index],
                placeholder: (context, url) => placeholder,
              )),
        ),
      ));

  final logo = SizedBox(
      height: 10.h,
      child: Image.asset(
        'assets/logo.png',
        height: 10.h,
        width: 30,
      ));
}

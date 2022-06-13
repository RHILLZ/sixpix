import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sixpix/services/flask_server.dart';
import 'package:sixpix/widgets/save_dialog.dart';

class AppController extends GetxController {
  final _images = [].obs;
  final _pageNumber = 0.obs;
  final RxString _searchQuery = ''.obs;
  final _isLoading = false.obs;
  final RxString _filename = ''.obs;
  final _isProcessing = false.obs;

  // GETTERS
  get searchQuery => _searchQuery.value;
  get images => _images;
  get pageNumber => _pageNumber.value;
  get isLoading => _isLoading.value;
  get isProcessing => _isProcessing.value;

  //SETTERS
  set searchQuery(value) => _searchQuery.value = value;
  set filename(value) => _filename.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void search() async {
    _isLoading.toggle();
    final results = await FlaskServer().getImages(_searchQuery.value);
    if (results != null) {
      _images.value = results['images'];
      print(results['images']);
      _pageNumber.value = results['page'];
      Get.toNamed('/showcase_view');
      _isLoading.toggle();
    } else {
      _isLoading.toggle();
      Get.snackbar(
        'something went wrong',
        'Please try again.',
      );
    }
  }

  void next() async {
    _isLoading.toggle();
    final results = await FlaskServer().sixMore();
    if (results != null) {
      _images.value = results['images'];
      _pageNumber.value = results['page'];
      _isLoading.toggle();
    } else {
      Get.snackbar('Something went wrong!', 'Try again.');
      _isLoading.toggle();
    }
  }

  void saveImage(String image) async {
    _isProcessing.toggle();
    _isLoading.toggle();
    final img = await Dio()
        .get(image, options: Options(responseType: ResponseType.bytes));

    final path = '/Users/rhillx/Downloads/${_filename.value}.jpeg';

    try {
      File(path).writeAsBytesSync(img.data);
      Get.snackbar('Success', '${_filename.value}.jpeg is saved on Downloads.',
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Uh Oh.', '$e.message',
          backgroundColor: Colors.red, colorText: Colors.white);
    }

    _isProcessing.toggle();
    _isLoading.toggle();
  }
}

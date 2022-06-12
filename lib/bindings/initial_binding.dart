import 'package:get/get.dart';
import 'package:sixpix/controllers/app_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
  }
}

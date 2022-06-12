import 'package:get/get.dart';
import 'package:sixpix/services/flask_server.dart';

class AppController extends GetxController {
  final _images = [].obs;
  final _pageNumber = ''.obs;
  final RxString _searchQuery = ''.obs;

  // GETTERS
  get searchQuery => _searchQuery.value;
  get images => _images;
  get pageNumber => _pageNumber.value;

  //SETTERS
  set searchQuery(value) => _searchQuery.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void search() async {
    final results = await FlaskServer().getImages(_searchQuery.value);
    print(results);
    // print('CLICKED!!');
  }
}

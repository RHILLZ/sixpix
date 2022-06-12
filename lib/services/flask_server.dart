import 'package:get/get_connect/connect.dart';

class FlaskServer extends GetConnect {
  final String base = 'http://192.168.1.2:5500';

  getImages(String query) async {
    final url = '$base/search/$query';

    final response = await httpClient.get(url);
    final data = response.body as Map<String, dynamic>;

    return data;
  }
}

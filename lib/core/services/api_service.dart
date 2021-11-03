import 'package:grroom_tinder_lite/model/apiModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<ApiModel> getData(String url) async {
    var request = http.Request(
      'GET',
      Uri.parse(url),
    );

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();

      return apiModelFromJson(jsonString);
    } else {
      print(response.reasonPhrase);
      return ApiModel();
    }
  }
}

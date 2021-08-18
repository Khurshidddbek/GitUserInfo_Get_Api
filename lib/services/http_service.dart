import 'package:http/http.dart';

class Network {
  static String BASE = 'api.github.com';
  static String API_GET = '/users/'; // {login}

  static Future<String?> GET(String api, String login) async {
    var uri = Uri.https(BASE, api + login);
    var response = await get(uri);
    if(response.statusCode == 200) return response.body;
    return null;
  }
}
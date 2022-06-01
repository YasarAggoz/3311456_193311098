import 'package:belindaproje/service/apimodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class api {
  final String url =
     "https://raw.githubusercontent.com/YasarAggoz/gnsz/main/volt.json";
  Future<gnsz?> gnszapi() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBody = gnsz.fromJson(jsonDecode(res.body));
      print("başarlı $jsonBody");
      return jsonBody;
    } else {
      print("başarısız");
    }
  }
}

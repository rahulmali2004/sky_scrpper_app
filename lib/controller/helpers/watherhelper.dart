import 'dart:convert';

import 'package:http/http.dart' as http;

class watherhelper {
  watherhelper._();

  static final watherhelper Watherhelper = watherhelper._();

  // lat and lon url
  String url =
      "http://api.openweathermap.org/geo/1.0/direct?q=surat&appid=6567c4d498ab31efee18ec494d0fbe7c";

  search({required String search}) {
    url =
    "http://api.openweathermap.org/geo/1.0/direct?q=$search&appid=6567c4d498ab31efee18ec494d0fbe7c";
  }

  Future<List?> getwather() async {
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      print("Lat & Lon");
      return data;
    }
  }

  Future<Map?> getwather2() async {
    List? data = await getwather();
    print("${data![0]['lat']}${data[0]['lon']}");
    http.Response response = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${data[0]['lat']}&lon=${data[0]['lon']}&appid=6567c4d498ab31efee18ec494d0fbe7c",
      ),
    );
    if (response.statusCode == 200) {
      Map datas = jsonDecode(response.body);
      print("${datas['base']}");
      return datas;
    }
  }
}

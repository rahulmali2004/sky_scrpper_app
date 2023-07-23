import 'package:flutter/material.dart';
import 'package:sky_scrpper_app/controller/helpers/watherhelper.dart';

class wathercontroller extends ChangeNotifier{
  Map? data;

  wathercontroller() {
    storeData();
  }

  Future<Map> storeData() async {
    watherhelper.Watherhelper.getwather();
    data = (await watherhelper.Watherhelper.getwather2())!;
    notifyListeners();
    return data!;
  }

  Future<Map> searchData({String q = "surat"}) async {
    watherhelper.Watherhelper.search(search: q);
    data = (await watherhelper.Watherhelper.getwather2())!;
    notifyListeners();
    return data!;
  }
}
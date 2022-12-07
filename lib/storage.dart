import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sezinsoft_demo/controller/basket_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  setBasketList(List<String> basketList) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('items', basketList);
  }

  getBasketList() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? items = prefs.getStringList('items');
    for (int i = 0; i < items!.length; i++) {
      print(items[i].toString());
    }

    return items;
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sezinsoft_demo/models/product_model.dart';

import '../models/basket_model.dart';

class BasketController extends GetxController {
  var tutar = 0.obs;
  dynamic basketList = [].obs;

  addToBasket(ProductModel product) async {
    basketList.add(product);

    final box = GetStorage();
    // Storing data
    //...
    var paymentsAsMap = basketList.map((basket) => basket.toJson()).toList();
    String jsonString = jsonEncode(paymentsAsMap);
    box.write('payments', jsonString);

    // fetching data
    var result = box.read('payments');
    dynamic jsonData = jsonDecode(result);
    basketList = jsonData.map((payment) => BasketModel.fromMap(jsonData)).toList().obs;
  }

  getTutar(){
    for(int i=0; i<basketList.length; i++){
      tutar += basketList[i].productPrice;
    }
  }
}

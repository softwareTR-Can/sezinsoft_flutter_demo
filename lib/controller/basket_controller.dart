import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sezinsoft_demo/models/product_model.dart';

import '../get_storage_service.dart';
import '../models/basket_model.dart';

dynamic basketList = [].obs;

var basketTotal = 0.0.obs;

class BasketController extends GetxController {
  var tutar = 0.0.obs;

  final box = GetStorage();

  addBasket(ProductModel product) {
    /// sepete ürün ekleme --- parametre ürün

    int adet = 1;

    for (int i = 0; i < basketList.length; i++) {
      if (product.categoryId == basketList[i].categoryId &&
          product.productId == basketList[i].productId) {
        /// ---
        adet = basketList[i].adet + 1;
        basketList.removeAt(i);
      }
    }

    basketList.add(BasketModel(
        adet: adet,
        productId: product.productId,
        productName: product.productName,
        productPrice: product.productPrice,
        productPhoto: product.productPhoto,
        categoryId: product.categoryId));

    var list = [];

    for (int i = 0; i < basketList.length; i++) {
      list.add(basketList[i].adet);
      list.add(basketList[i].productName);
      list.add(basketList[i].productPrice);
      list.add(basketList[i].productPhoto);
      list.add(basketList[i].productId);
      list.add(basketList[i].categoryId);
    }

    GetStorageServices().saveListWithGetStorage('baskettt', list);
    print(GetStorageServices().readWithGetStorage('baskettt'));
  }

  deleteBasket(ProductModel product) {
    /// sepetten ürün çıkartma --- parametre ürün

    for (int i = 0; i < basketList.length; i++) {
      if (product.categoryId == basketList[i].categoryId &&
          product.productId == basketList[i].productId) {
        /// ---
        var adet = basketList[i].adet - 1;

        basketList.removeAt(i);

        adet == 0
            ? null
            : basketList.add(BasketModel(
                adet: adet,
                productId: product.productId,
                productName: product.productName,
                productPrice: product.productPrice,
                productPhoto: product.productPhoto,
                categoryId: product.categoryId));
      }
    }

    var list = [];

    for (int i = 0; i < basketList.length; i++) {
      list.add(basketList[i].adet);
      list.add(basketList[i].productName);
      list.add(basketList[i].productPrice);
      list.add(basketList[i].productPhoto);
      list.add(basketList[i].productId);
      list.add(basketList[i].categoryId);
    }

    GetStorageServices().saveListWithGetStorage('baskettt', list);
    print(GetStorageServices().readWithGetStorage('baskettt'));
  }

  getBasket() {
    var list = box.read('baskettt');
    //var list = GetStorageServices().readWithGetStorage('baskettt');

    for (int i = 0; i < list.length / 6; i += 6) {
      basketList.add(BasketModel(
        adet: int.parse(list[i]),
        productId: int.parse(list[i + 1]),
        productName: list[i + 2],
        productPrice: double.parse(list[i + 3]),
        productPhoto: list[i + 4],
        categoryId: int.parse(list[i + 5]),
      ));
    }
  }

  addTutar(productPrice) {
    basketTotal.value += productPrice;
    box.write('basketTotal', basketTotal.value);
    print(basketTotal.toString());
  }

  deleteTutar(productPrice) {
    basketTotal.value -= productPrice;
    box.write('basketTotal', basketTotal.value);
    print(basketTotal.toString());
  }

  getTutarInStorage() {
    basketTotal.value = box.read('basketTotal');
    print(basketTotal.toString());
  }
}

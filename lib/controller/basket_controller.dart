import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sezinsoft_demo/models/product_model.dart';

import '../storage.dart';
import '../models/basket_model.dart';

dynamic basketList = [].obs;

var basketTotal = 0.0.obs;

class BasketController extends GetxController {
  var tutar = 0.0.obs;
  var storageList = [].obs;
  var box = GetStorage();

  addBasket(ProductModel product) {
    /// sepete ürün ekleme --- parametre ürün

    // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    // var storage = box.read('baskettt');
    // print(storage);
    // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    // print(box.read('baskettt').toString());
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

    List<String> list = [];

    for (int i = 0; i < basketList.length; i++) {
      list.add(basketList[i].adet.toString());
      list.add(basketList[i].productName.toString());
      list.add(basketList[i].productPrice.toString());
      list.add(basketList[i].productPhoto.toString());
      list.add(basketList[i].productId.toString());
      list.add(basketList[i].categoryId.toString());
    }

    //GetStorageServices().saveListWithGetStorage('baskettt2', list);
    Prefs().setBasketList(list);
    //print(GetStorageServices().readWithGetStorage('baskettt2'));
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

    List<String> list = [];

    for (int i = 0; i < basketList.length; i++) {
      list.add(basketList[i].adet.toString());
      list.add(basketList[i].productName.toString());
      list.add(basketList[i].productPrice.toString());
      list.add(basketList[i].productPhoto.toString());
      list.add(basketList[i].productId.toString());
      list.add(basketList[i].categoryId.toString());
    }

    //GetStorageServices().saveListWithGetStorage('baskettt2', list);
    Prefs().setBasketList(list);
    //print(GetStorageServices().readWithGetStorage('baskettt2'));
  }

  getBasket() async {
    //GetStorageServices().readWithGetStorage('baskettt2');
    List<String> list = await Prefs().getBasketList();

    try {
      //List list = GetStorageServices().readWithGetStorage('baskettt2');
      if (list.isNotEmpty) {
        for (int i = 0; i < list.length / 6; i += 6) {
          print('AAa $i');
          var i2 = '';
          var i4 = '';
          try {
            i2 = list[i + 2].toString();
            i4 = list[i + 4].toString();
          } catch (e) {
            print('hataaaaaaaaaaaaaaaaa');
            print('hata ${e.toString()}');
          }
          i2 = list[i + 2].toString();
          i4 = list[i + 4].toString();

          basketList.add(BasketModel(
            adet: int.parse(list[i].toString()),
            productId: int.parse(list[i + 1].toString()),
            productName: i2,
            productPrice: double.parse(list[i + 3].toString()),
            productPhoto: i4,
            categoryId: int.parse(list[i + 5].toString()),
          ));
        }
      } else {}
    } catch (e) {
      print(e.toString());
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
    basketTotal.value = box.read('basketTotal')??0.0;
    print(basketTotal.toString());
  }
}

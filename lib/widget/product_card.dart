import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezinsoft_demo/models/product_model.dart';

import '../constants.dart';
import '../controller/basket_controller.dart';

//var tutar = 0.0.obs;
BasketController controller = BasketController();

productCard(ProductModel product) {
  var adet = 0.obs;

  for(int i =0;i<basketList.length;i++){
    if(product.productId == basketList[i].productId && product.categoryId == basketList[i].categoryId){
      adet.value = basketList[i].adet;
    }
  }
  return Card(
      elevation: 0,
      color: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Text(product.productName,
                        style: kProductCardTextStyle)),
                Text(
                  "${product.productPrice.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} TL",
                  style: kProductCardTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 10),
                Obx(() => adet < 1
                    ? ekleWidget(adet, product)
                    : adetWidget(adet, product)),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: Get.height / 4,
            // width: Get.width / 2.1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: Image.network(product.productPhoto, fit: BoxFit.fill),
            ),
          ),
        ],
      ));
}

ekleWidget(var adet, ProductModel product) {
  return GestureDetector(
    onTap: () {
      adet++;
      controller.addTutar(product.productPrice);
      controller.addBasket(product);
    },
    child: Container(
      width: Get.width / 5.2,
      height: Get.height / 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: Colors.black),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.add, color: Colors.white, size: 24),
          ),
          Text('Ekle', style: kTextStyle.copyWith(color: Colors.white)),
        ],
      ),
    ),
  );
}

adetWidget(var adet, ProductModel product) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(35),
    ),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            adet--;
            controller.deleteTutar(product.productPrice);
            controller.deleteBasket(product);
          },
          child: Row(
            children: [
              Container(
                width: 40,
                child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          width: 40,
          color: Colors.grey,
          child: Center(
              child: Obx(() => Text(
                    adet.toString(),
                    style: kTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ))),
        ),
        GestureDetector(
          onTap: () {
            adet++;
            controller.addTutar(product.productPrice);
            controller.addBasket(product);
            //BasketController().denemeBasketTutar(productPrice);
          },
          child: Row(
            children: [
              Container(
                width: 40,
                child:
                    Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

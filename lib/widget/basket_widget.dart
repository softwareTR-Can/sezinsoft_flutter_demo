import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezinsoft_demo/controller/basket_controller.dart';

import '../constants.dart';
import 'product_card.dart';

buildBasketWidget() {
  BasketController controller = BasketController();

  return Row(
    children: [
      const Spacer(),
      Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.shopping_basket_rounded, color: kIconColor),
              const SizedBox(width: 20),
              Obx(
                () => Text(
                    "${tutar.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} TL",
                    style: kTextStyle.copyWith(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

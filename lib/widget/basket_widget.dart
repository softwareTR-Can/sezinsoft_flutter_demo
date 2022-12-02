import 'package:flutter/material.dart';
import 'package:sezinsoft_demo/controller/basket_controller.dart';

import '../constants.dart';

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
              Text(controller.tutar.toString(),
                  style: kTextStyle.copyWith(color: Colors.white)),
            ],
          ),
        ),
      ),
    ],
  );
}

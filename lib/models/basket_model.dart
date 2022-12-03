import 'dart:convert';

import 'package:sezinsoft_demo/models/product_model.dart';

class BasketModel extends ProductModel {
  BasketModel(
      {required this.adet,
      required super.productId,
      required super.productName,
      required super.productPrice,
      required super.productCurrency,
      required super.productPhoto,
      required super.categoryId,
      required super.categoryName});

  final int adet;

  factory BasketModel.fromMap(Map<String, dynamic> json) => BasketModel(
        adet: json["adet"],
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"].toDouble(),
        productCurrency: json["product_currency"],
        productPhoto: json["product_photo"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );
}

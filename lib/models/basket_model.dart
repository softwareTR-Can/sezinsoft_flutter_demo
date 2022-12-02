import 'dart:convert';

import 'package:sezinsoft_demo/models/product_model.dart';

class BasketModel extends ProductModel{
  BasketModel({required this.adet,  required super.productId, required super.productName, required super.productPrice, required super.productCurrency, required super.productPhoto, required super.categoryId, required super.categoryName});

  final int adet;

  //factory BasketModel.fromJson(String str) => BasketModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "adet": adet,
    "product_id": productId,
    "product_name": productName,
    "product_price": productPrice,
    "product_currency": productCurrency,
    "product_photo": productPhoto,
    "category_id": categoryId,
    "category_name": categoryName,
  };

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
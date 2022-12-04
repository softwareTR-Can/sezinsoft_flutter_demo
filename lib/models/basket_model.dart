import 'dart:convert';

class BasketModel {
  BasketModel({
    required this.adet,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productPhoto,
    required this.categoryId,
  });

  final int adet;
  final int productId;
  final String productName;
  final double productPrice;
  final String productPhoto;
  final int categoryId;

  // set adet(int value) {
  //   adet = value;
  // }

  factory BasketModel.fromMap(Map<String, dynamic> json) => BasketModel(
        adet: json["adet"],
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"].toDouble(),
        productPhoto: json["product_photo"],
        categoryId: json["category_id"],
      );
}

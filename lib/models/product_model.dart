import 'dart:convert';

ProductResponseModel productResponseModelFromMap(String str) =>
    ProductResponseModel.fromMap(json.decode(str));

String productResponseModelToMap(ProductResponseModel data) =>
    json.encode(data.toMap());

class ProductResponseModel {
  ProductResponseModel({
    required this.responseVal,
    required this.responseText,
    required this.data,
  });

  final int responseVal;
  final String responseText;
  final List<ProductModel> data;

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductResponseModel(
        responseVal: json["response_val"],
        responseText: json["response_text"],
        data: List<ProductModel>.from(
            json["data"].map((x) => ProductModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "response_val": responseVal,
        "response_text": responseText,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class ProductModel {
  ProductModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productCurrency,
    required this.productPhoto,
    required this.categoryId,
    required this.categoryName,
  });

  final int productId;
  final String productName;
  final double productPrice;
  final String productCurrency;
  final String productPhoto;
  final int categoryId;
  final String categoryName;

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"].toDouble(),
        productCurrency: json["product_currency"],
        productPhoto: json["product_photo"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toMap() {
    return {
      "product_id": productId.toString(),
      "product_name": productName.toString(),
      "product_price": productPrice.toString(),
      "product_currency": productCurrency.toString(),
      "product_photo": productPhoto.toString(),
      "category_id": categoryId.toString(),
      "category_name": categoryName.toString(),
    };
  }
}

import 'dart:convert';

CategoryResponseModel categoryModelFromMap(String str) =>
    CategoryResponseModel.fromMap(json.decode(str));

String categoryModelToMap(CategoryResponseModel data) => json.encode(data.toMap());

class CategoryResponseModel {
  CategoryResponseModel({
    required this.responseVal,
    required this.responseText,
    required this.data,
  });

  final int responseVal;
  final String responseText;
  final List<CategoryModel> data;

  factory CategoryResponseModel.fromMap(Map<String, dynamic> json) => CategoryResponseModel(
        responseVal: json["response_val"],
        responseText: json["response_text"],
        data: List<CategoryModel>.from(json["data"].map((x) => CategoryModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "response_val": responseVal,
        "response_text": responseText,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class CategoryModel {
  CategoryModel({
    required this.categoryId,
    required this.categoryName,
  });

  final int categoryId;
  final String categoryName;

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category_name": categoryName,
      };
}

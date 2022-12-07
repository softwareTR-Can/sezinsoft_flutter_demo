import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sezinsoft_demo/models/product_model.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ProductController extends GetxController {
  dynamic productList = [].obs;
  var box = GetStorage();

  Future<ProductResponseModel> getProduct(int categoryId) async {
    final response = await http.post(
      Uri.parse('${serviceUrl}get-product'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "token": box.read('token').toString(),
        "category_id": "${categoryId}"
      }),
    );
    var data = jsonDecode(response.body);
    //categoryList.add(jsonDecode(response.body)['data']);
    //categoryList = mapData.entries.map( (entry) => CategoryModel(categoryId: ['categoryId'],categoryName: ,)).toList();

    productList =
        data['data'].map<ProductModel>((x) => ProductModel.fromMap(x)).toList();

    if (response.statusCode == 201) {
      return ProductResponseModel.fromMap(jsonDecode(response.body));
    } else if (response.statusCode == 200) {
      return ProductResponseModel.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}

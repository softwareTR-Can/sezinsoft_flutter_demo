import 'dart:convert';
import 'package:get/get.dart';
import 'package:sezinsoft_demo/models/product_model.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ProductController extends GetxController {
  dynamic productList = [].obs;

  Future<ProductResponseModel> getProduct(int categoryId) async {
    final response = await http.post(
      Uri.parse('${serviceUrl}get-product'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "token": "2C2322E3-5696-45B8-923D-3C932EC21710",
        "category_id": "${categoryId}"
      }),
    );
    print('product get çalıştı');
    var data = jsonDecode(response.body);
    //categoryList.add(jsonDecode(response.body)['data']);
    //categoryList = mapData.entries.map( (entry) => CategoryModel(categoryId: ['categoryId'],categoryName: ,)).toList();

    productList =
        data['data'].map<ProductModel>((x) => ProductModel.fromMap(x)).toList();

    for (int i = 0; i < productList.length; i++) {
      print(productList[i].productName);
    }
    print(jsonDecode(response.body));

    if (response.statusCode == 201) {
      print(response.statusCode.toString());

      return ProductResponseModel.fromMap(jsonDecode(response.body));
    } else if (response.statusCode == 200) {
      print(response.statusCode.toString());

      return ProductResponseModel.fromMap(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to create album.');
    }
  }
}

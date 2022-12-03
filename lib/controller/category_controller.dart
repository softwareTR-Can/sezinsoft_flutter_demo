import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sezinsoft_demo/models/category_model.dart';

import '../constants.dart';

class CategoryController extends GetxController {
  dynamic categoryList = [].obs;

  Future<CategoryResponseModel> getCategory(String title) async {
    final response = await http.post(
      Uri.parse('${serviceUrl}get-category'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"token": "2C2322E3-5696-45B8-923D-3C932EC21710"}),
    );
    var data = jsonDecode(response.body);

    categoryList = data['data']
        .map<CategoryModel>((x) => CategoryModel.fromMap(x))
        .toList();

    //Aynı Kategoriden birden fazla geldiğinde silmek için -> (Fit&Form kategorisi gibi)
    for (int i = 0; i < 1; i++) {
      for (int j = 0; j < 5; j++) {
        if (categoryList[i].categoryId == categoryList[j].categoryId) {
          categoryList.removeAt(categoryList[i + 1].categoryId);
        }
        //----
      }
    }

    for (int i = 0; i < categoryList.length; i++) {
      print(categoryList[i].categoryName);
    }

    print(jsonDecode(response.body));

    if (response.statusCode == 201) {
      print(response.statusCode.toString());

      return CategoryResponseModel.fromMap(jsonDecode(response.body));
    } else if (response.statusCode == 200) {
      print(response.statusCode.toString());

      return CategoryResponseModel.fromMap(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to create album.');
    }
  }
}

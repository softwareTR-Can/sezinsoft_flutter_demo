import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sezinsoft_demo/models/category_model.dart';

import '../constants.dart';

var box = GetStorage();

class CategoryController extends GetxController {
  dynamic categoryList = [].obs;

  Future<CategoryResponseModel> getCategory(String title) async {
    final response = await http.post(
      Uri.parse('${serviceUrl}get-category'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"token": box.read('token').toString()}),
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

    if (response.statusCode == 201) {
      return CategoryResponseModel.fromMap(jsonDecode(response.body));
    } else if (response.statusCode == 200) {
      return CategoryResponseModel.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}

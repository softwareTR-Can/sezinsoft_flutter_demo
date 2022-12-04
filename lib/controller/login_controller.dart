import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sezinsoft_demo/get_storage_service.dart';
import 'package:sezinsoft_demo/models/login_response_model.dart';
import 'package:sezinsoft_demo/views/dashboard_screen.dart';

import '../constants.dart';
import '../show_snackbar.dart';

var username = ''.obs;

Future<LoginResponseModel> login(String username, String password) async {
  LoginResponseModel loginResponseModel;
  final box = GetStorage();
  SnackbarMessage snackbar = SnackbarMessage();

  final response = await http.post(
    Uri.parse('${serviceUrl}login-submit'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  print(jsonDecode(response.body));

  if (response.statusCode == 201) {
    print(response.statusCode.toString());

    loginResponseModel = LoginResponseModel.fromMap(jsonDecode(response.body));
  } else if (response.statusCode == 200) {
    print(response.statusCode.toString());

    loginResponseModel = LoginResponseModel.fromMap(jsonDecode(response.body));
  } else {
    print(response.statusCode.toString());
    throw Exception('Failed');
  }

  if (loginResponseModel.responseVal == 0) {
    //Giriş Başarılı -- Dashboard'a yönlendiriliyor

    box.write('token', loginResponseModel.token);
    getUser();
    Get.to(Dashboard_Screen());
  } else {
    snackbar.showSnackbar(
        message: loginResponseModel.responseText, status: Snackbar.error);
  }

  return LoginResponseModel.fromMap(jsonDecode(response.body));
}

bool isLogged() {
  if (box.read('token').toString() == null) {
    return false;
  } else {
    getUser();
    return true;
  }
}

void getUser() async {
  final response = await http.post(
    Uri.parse('${serviceUrl}get-user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'token': '2C2322E3-5696-45B8-923D-3C932EC21710',
    }),
  );

  print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    print(response.statusCode.toString());

    var jsonData = jsonDecode(response.body);
    var user = jsonData['data'];
    var userName = user['name'];
    box.write('username', userName);
    username.value = userName;
    print(box.read('username'));
  } else {
    print(response.statusCode.toString());
    throw Exception('Failed');
  }
}

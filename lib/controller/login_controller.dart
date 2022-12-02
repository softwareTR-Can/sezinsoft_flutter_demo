import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sezinsoft_demo/models/login_response_model.dart';

import '../constants.dart';

Future<LoginResponseModel> login(String title) async {
  final response = await http.post(
    Uri.parse('${serviceUrl}login-submit'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': 'flutter.demo',
      'password': '123456',
    }),
  );

  print(jsonDecode(response.body));

  if (response.statusCode == 201) {
    print(response.statusCode.toString());

    return LoginResponseModel.fromMap(jsonDecode(response.body));
  }
  else if(response.statusCode == 200){
    print(response.statusCode.toString());

    return LoginResponseModel.fromMap(jsonDecode(response.body));
  }
  else {
    print(response.statusCode.toString());
    throw Exception('Failed to create album.');
  }
}
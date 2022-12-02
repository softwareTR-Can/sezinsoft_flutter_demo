import 'dart:convert';

LoginResponseModel loginResponseModelFromMap(String str) => LoginResponseModel.fromMap(json.decode(str));

String loginResponseModelToMap(LoginResponseModel data) => json.encode(data.toMap());

class LoginResponseModel {
  LoginResponseModel({
    required this.responseVal,
    required this.responseText,
    required this.token,
  });

  final int responseVal;
  final String responseText;
  final String token;

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
    responseVal: json["response_val"]??1,
    responseText: json["response_text"]??'',
    token: json["token"]??'',
  );

  Map<String, dynamic> toMap() => {
    "response_val": responseVal,
    "response_text": responseText,
    "token": token,
  };
}

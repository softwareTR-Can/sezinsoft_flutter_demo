import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezinsoft_demo/views/dashboard_screen.dart';
import 'package:sezinsoft_demo/views/login_screen.dart';

import 'controller/login_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //login('');
    // num balance = 12.8;
    // print("${balance.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},") }");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Dashboard_Screen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  String kullaniciAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Text('Giriş Formu')),
          Expanded(child: buildForm()),
        ],
      ),
    );
  }

  Form buildForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Kullanıcı Adı',
            ),
            onChanged: (value) => kullaniciAdi = value,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Parola',
            ),
            onChanged: (value) => kullaniciAdi = value,
          ),
        ],
      ),
    );
  }
}

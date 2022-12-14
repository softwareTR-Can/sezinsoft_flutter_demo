import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sezinsoft_demo/controller/basket_controller.dart';
import 'package:sezinsoft_demo/storage.dart';
import 'package:sezinsoft_demo/views/dashboard_screen.dart';
import 'package:sezinsoft_demo/views/login_screen.dart';

import 'controller/login_controller.dart';

void main() async{
  await GetStorage.init();
  BasketController().getTutarInStorage();
  BasketController().getBasket();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //BasketController().getBasket();
    //Prefs().setBasketList(['1','2','3','4','5','6']);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: isLogged() ? Dashboard_Screen() : LoginScreen(),
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

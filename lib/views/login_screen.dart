import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String kullaniciAdi = '';
  String parola = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    const Text(
                      "Giriş Formu",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    buildForm(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    buildButton()
                  ],
                ),
              ),
            ),
          ),
        ),
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
          TextFormField(
            decoration: InputDecoration(
              //hintText: 'Parola',
              labelText: 'Parola',
            ),
            onChanged: (value) => kullaniciAdi = value,
          ),
        ],
      ),
    );
  }

  buildButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(8),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Center(
        child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            width: Get.width * 0.8,
            child: const Text(
              'Giriş',
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}

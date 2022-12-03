import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezinsoft_demo/constants.dart';
import 'package:sezinsoft_demo/controller/login_controller.dart';

buildUsernameWidget() {
  return Row(
    children: [
      Container(
        child: Obx(() => Text(username.toString(),
            style: kTextStyle.copyWith(fontSize: 32))),
      ),
      const Spacer(),
    ],
  );
}

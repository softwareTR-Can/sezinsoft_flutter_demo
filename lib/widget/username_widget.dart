import 'package:flutter/material.dart';
import 'package:sezinsoft_demo/constants.dart';

buildUsernameWidget() {
  return Row(
    children: [
      Container(
        child: Text('Umutcan Bağdu', style: kTextStyle.copyWith(fontSize: 32)),
      ),
      const Spacer(),
    ],
  );
}

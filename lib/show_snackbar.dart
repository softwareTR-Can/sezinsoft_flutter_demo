import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Snackbar { error, info, success }

class SnackbarMessage{
  void showSnackbar({String message="", Snackbar status=Snackbar.info}) {
    ThemeData themeData = Theme.of(Get.context!);
    Color bgColor;
    print(status);

    switch (status) {
      case Snackbar.success:
        {
          bgColor = Colors.green;
        }
        break;
      case Snackbar.info:
        {
          bgColor = Colors.blue;
        }
        break;

      case Snackbar.error:
        {
          bgColor = Colors.red;
        }
        break;

      default:
        {
          bgColor = themeData.colorScheme.primary;
        }
        break;
    }

    SnackBar snackbar = SnackBar(
      content: Text(
        message,
        style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onPrimary)),
      ),
      backgroundColor: bgColor,
    );

    ScaffoldMessenger.of(Get.context!).showSnackBar(snackbar);
  }

}
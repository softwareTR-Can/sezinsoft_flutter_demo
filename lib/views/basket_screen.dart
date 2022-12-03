import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezinsoft_demo/constants.dart';
import 'package:sezinsoft_demo/widget/basket_widget.dart';
import 'package:sezinsoft_demo/widget/product_card.dart';
import 'package:sezinsoft_demo/widget/username_widget.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBasketWidget(),
              buildUsernameWidget(),
              buildBasketDescription(),
            ],
          ),
        ),
      ),
    );
  }

  buildBasketDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text('Sepetim', style: kTextStyle.copyWith(fontSize: 24)),
        Text(
            'Tutar: ${tutar.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} TL',
            style: kTextStyle.copyWith(fontSize: 24)),
      ],
    );
  }
}

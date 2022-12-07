import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezinsoft_demo/constants.dart';
import 'package:sezinsoft_demo/controller/category_controller.dart';
import 'package:sezinsoft_demo/widget/basket_widget.dart';
import 'package:sezinsoft_demo/widget/username_widget.dart';

import '../controller/product_controller.dart';
import '../storage.dart';
import '../widget/product_card.dart';

class Dashboard_Screen extends StatefulWidget {
  const Dashboard_Screen({Key? key}) : super(key: key);

  @override
  State<Dashboard_Screen> createState() => _Dashboard_ScreenState();
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {
  late Future futureCategory;
  late Future futureProduct;
  var inSelectedCategoryId = 1;

  CategoryController categoryController = CategoryController();
  ProductController productController = ProductController();

  @override
  void initState() {
    futureCategory = categoryController.getCategory('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildBasketWidget(),
              buildUsernameWidget(),
              buildCategory(),
              Expanded(
                child: Container(
                  child: buildProduct(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        height: 35,
        child: Expanded(
          child: FutureBuilder<dynamic>(
              future: futureCategory,
              builder: (context, snapshot) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryController.categoryList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          inSelectedCategoryId =
                              categoryController.categoryList[index].categoryId;
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == inSelectedCategoryId - 1
                                ? Colors.black
                                : Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categoryController
                                  .categoryList[index].categoryName
                                  .toString(),
                              style: index == inSelectedCategoryId - 1
                                  ? kTextStyle.copyWith(color: Colors.white)
                                  : kTextStyle,
                            ),
                          )),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }

  buildProduct() {
    return FutureBuilder<dynamic>(
        future: productController.getProduct(inSelectedCategoryId),
        builder: (context, snapshot) {
          return ListView.builder(
              //physics: BouncingScrollPhysics(),
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                // GetStorageServices().saveListWithGetStorage('storageKey', [
                //   1,'2',3,4.2,'abc'
                // ]);
                // GetStorageServices().readWithGetStorage('storageKey');
                return Column(
                  children: [
                    productCard(productController.productList[index]),
                    const SizedBox(height: 30),
                  ],
                );
              });
        });
  }
}

/*
ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 5.0,
                    color: Colors.red,
                    width: 100.0,
                  ),
                  Container(
                    height: 20.0,
                    color: Colors.blue,
                    width: 100,
                  ),
                  Container(
                    height: 20.0,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 20.0,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 20.0,
                    width: 100,
                    color: Colors.orange,
                  ),
                ],
              );
 */

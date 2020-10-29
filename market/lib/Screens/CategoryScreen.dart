import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Models/Category.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:market/Screens/CartScreen.dart';
import 'package:market/Screens/ProductDetails.dart';

import 'package:market/Widgets/ProductsWidget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryScreen({Key key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: NetworkImage(categoryModel.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            iconSize: 25,
                            color: Colors.black,
                            onPressed: () => Navigator.pop(context)),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                onPressed: () {
                                  changeScreen(context, CartScreen());
                                }),
                            Positioned(
                              bottom: 8,
                              right: 5,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                      userProvider.userModel.cart.length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Text(
                          categoryModel.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Column(
                children: productProvider.productsByCategory.map((item) {
                  return GestureDetector(
                      onTap: () {
                        changeScreen(context, ProductDetails(product: item));
                      },
                      child: ProductWidget(
                        product: item,
                      ));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

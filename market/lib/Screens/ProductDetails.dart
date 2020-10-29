import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Models/Product.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:market/Screens/CartScreen.dart';

import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({Key key, @required this.product}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width - 50,
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
                      image: NetworkImage(widget.product.image),
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
                          widget.product.name,
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
                padding: const EdgeInsets.only(top: 10, bottom: 15, left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("Each (1Kg)",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: Flexible(
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                child: Icon(EvaIcons.clockOutline),
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)))),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery Time",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Text("20-30 Min",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ugx " + widget.product.price.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 32)),
                  Row(
                    children: [
                      Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          child: IconButton(
                              icon: Icon(
                                EvaIcons.plus,
                                size: 20,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  quantity += 1;
                                });
                              }),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          child: IconButton(
                              icon: Icon(
                                EvaIcons.minus,
                                size: 20,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (quantity != 1) {
                                  setState(() {
                                    quantity -= 1;
                                  });
                                }
                              }),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)))),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 50,
              child: OutlineButton(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 32,
                ),
                onPressed: () async {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: RaisedButton(
                elevation: 0,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('Add to cart',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () async {
                  appProvider.changeLoadingState();

                  bool value = await userProvider.addToCart(
                      product: widget.product, quantity: quantity);
                  if (value) {
                    print("ADDED");
                    _key.currentState
                        .showSnackBar(SnackBar(content: Text("ADDED TO CART")));
                    userProvider.getUser();
                    appProvider.changeLoadingState();
                  } else {
                    _key.currentState.showSnackBar(
                        SnackBar(content: Text("NOT ADDED TO CART")));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market/Models/Product.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/UserProvider.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                  icon: Icon(
                    EvaIcons.shoppingBag,
                    color: Colors.black,
                    size: 35,
                  ),
                  onPressed: null),
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
                    child: Text("22",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image(image: NetworkImage(widget.product.image)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          EvaIcons.plusCircleOutline,
                          size: 32,
                        ),
                        onPressed: () {
                          setState(() {
                            quantity += 1;
                          });
                        }),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        icon: Icon(
                          EvaIcons.minusCircleOutline,
                          size: 32,
                        ),
                        onPressed: () {
                          if (quantity != 1) {
                            setState(() {
                              quantity -= 1;
                            });
                          }
                        }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "UGX " + (widget.product.price * quantity).toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
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
                          _key.currentState.showSnackBar(
                              SnackBar(content: Text("ADDED TO CART")));
                        } else {
                          _key.currentState.showSnackBar(
                              SnackBar(content: Text("NOT ADDED TO CART")));
                        }
                        appProvider.changeLoadingState();
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //         icon: Icon(
            //           Icons.remove,
            //           size: 20,
            //         ),
            //         onPressed: null),
            //     GestureDetector(
            //       onTap: () {},
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.black,
            //         ),
            //         child: Padding(
            //             padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            //             child: Text("Add to bag",
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 22,
            //                 ))),
            //       ),
            //     ),
            //     IconButton(
            //         icon: Icon(Icons.add, size: 20, color: Colors.black),
            //         onPressed: null),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

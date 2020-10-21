import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:market/Helpers/OrderService.dart';
import 'package:market/Models/OrderItem.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:market/Widgets/OrderItem.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key key,
  }) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  OrderService _orderService = OrderService();
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    //get total cart price

    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "shopping bag",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: userProvider.userModel.cart == null
          ? Text("Nothing")
          : OrderItemWidget(),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Total: ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: userProvider.userModel.totalCartPrice == null
                          ? "0"
                          : userProvider.userModel.totalCartPrice.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FlatButton(
                  child: Text(
                    "Checkout",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  onPressed: () {
                    if (userProvider.userModel.totalCartPrice == 0) {
                      _showDialog(
                        Text("data"),
                        Text("Empty cart"),
                        null,
                        FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    } else {
                      _showDialog(
                        Text("data"),
                        Text(
                            "you will be charged ${userProvider.userModel.totalCartPrice}"),
                        FlatButton(
                          child: new Text("Accept"),
                          onPressed: () async {
                            var uuid = Uuid();
                            String orderId = uuid.v4();
                            _orderService.createOrder(
                                userId: userProvider.user.uid,
                                id: orderId,
                                description: "something",
                                status: "complete",
                                totalPrice:
                                    userProvider.userModel.totalCartPrice,
                                cart: userProvider.userModel.cart);
                            for (OrderItemModel cartItem
                                in userProvider.userModel.cart) {
                              appProvider.changeLoadingState();
                              bool value = await userProvider.removeFromCart(
                                  cartItem: cartItem);
                              if (value) {
                                userProvider.getUser();
                                _key.currentState.showSnackBar(
                                    SnackBar(content: Text("ORDER CREATED")));
                                appProvider.changeLoadingState();
                                return;
                              }
                            }
                            Navigator.of(context).pop();
                            _key.currentState.showSnackBar(
                                SnackBar(content: Text("ORDER CREATED")));
                          },
                        ),
                        FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//Show dialog

  void _showDialog(
      Text title, Text content, FlatButton accept, FlatButton reject) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: title,
          content: content,
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            accept, reject
            // new FlatButton(
            //   child: new Text("Accept"),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            // new FlatButton(
            //   child: new Text("Close"),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
          ],
        );
      },
    );
  }
}

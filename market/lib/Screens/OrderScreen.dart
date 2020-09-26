import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:market/Widgets/OrderItem.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    //get total cart price

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: true,
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
                  onPressed: null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

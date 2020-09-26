import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:provider/provider.dart';

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({
    Key key,
  }) : super(key: key);
  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Padding(
      key: _key,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: userProvider.userModel.cart.length,
          itemBuilder: (BuildContext context, int index) {
            int priceSum = 0;
            int totalQuantity = 0;
            int itemTotalPrice = 0;

            for (Map cartItem in userProvider.userModel.cart) {
              totalQuantity = totalQuantity + cartItem["quantity"];
              priceSum = priceSum + cartItem["amount"];
              int itemQuantity = cartItem["quantity"];
              int itemPrice = cartItem["amount"];
              itemTotalPrice = itemQuantity * itemPrice;
            }
            appProvider.changeTotalPrice(newTotal: totalQuantity * priceSum);
            return Container(
              height: 120,
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(1, 1),
                        blurRadius: 4),
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Image.network(
                    userProvider.userModel.cart[index]["image"],
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomLeft,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userProvider.userModel.cart[index]["name"],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                            userProvider.userModel.cart[index]["amount"]
                                .toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            userProvider.userModel.cart[index]["quantity"]
                                .toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  IconButton(
                      icon: Icon(EvaIcons.trash),
                      onPressed: () async {
                        appProvider.changeLoadingState();
                        bool value = await userProvider.removeFromCart(
                            cartItem: userProvider.userModel.cart[index]);
                        if (value) {
                          userProvider.getUser();
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "${userProvider.userModel.cart[index]["name"]} removed from cart")));

                          appProvider.changeLoadingState();
                          return;
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "${userProvider.userModel.cart[index]["name"]} not removed")));
                        }
                      })
                ],
              ),
            );
          }),
    );
  }
}

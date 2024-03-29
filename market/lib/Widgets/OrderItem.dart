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
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Expanded(
                  child: Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200],
                              offset: Offset(1, 1),
                              blurRadius: 4),
                        ],
                        borderRadius: BorderRadius.circular(22)),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 100,
                        width: 120,
                        child: Image.network(
                          userProvider.userModel.cart[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: IconButton(
                          icon: Icon(
                            EvaIcons.trash2Outline,
                            size: 20,
                          ),
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
                          }),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  userProvider.userModel.cart[index]["name"],
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.plusCircleOutline,
                                    size: 20,
                                  ),
                                  onPressed: () {}),
                              Text(
                                userProvider.userModel.cart[index]["quantity"]
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.minusCircleOutline,
                                    size: 18,
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      child: Text(
                          "Ugx " +
                              userProvider.userModel.cart[index]["amount"]
                                  .toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }
}

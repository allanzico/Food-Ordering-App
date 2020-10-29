import 'package:flutter/material.dart';
import 'package:market/Models/Order.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Orders",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: userProvider.orders.length,
          itemBuilder: (BuildContext context, int index) {
            OrderModel _order = userProvider.orders[index];
            var date =
                DateTime.fromMicrosecondsSinceEpoch(_order.createdAt * 1000);
            var _createdAt = DateFormat.yMMMd().format(date);

            String name;

            for (Map cartItem in userProvider.orders[index].cart) {
              name = cartItem["name"];
            }

            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(1, 1),
                        blurRadius: 4),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Created At: ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Text(_createdAt,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 70,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: _order.status == "complete"
                                  ? Colors.green
                                  : _order.status == "pending"
                                      ? Colors.black45
                                      : Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              _order.status,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(
                    height: 30,
                    thickness: 0.3,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(_order.cart.length, (index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(_order.cart[index]["name"]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                    _order.cart[index]["quantity"].toString()),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                    _order.cart[index]["amount"].toString()),
                              )
                            ],
                          ),
                          Divider(
                            height: 15,
                            thickness: 0.3,
                            indent: 5,
                            endIndent: 5,
                          ),
                        ],
                      );
                    }),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    color: Colors.grey[100],
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            _order.description,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Total: ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              )),
                          TextSpan(
                              text: _order.totalPrice.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ])),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

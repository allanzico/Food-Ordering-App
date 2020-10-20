import 'package:flutter/material.dart';
import 'package:market/Models/Order.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:provider/provider.dart';

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
          "Orders",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: userProvider.orders.length,
          itemBuilder: (BuildContext context, int index) {
            OrderModel _order = userProvider.orders[index];

            return ListTile(
              leading: Text(_order.totalPrice.toString()),
              title: Text(_order.description),
              subtitle: Text(
                  DateTime.fromMicrosecondsSinceEpoch(_order.createdAt)
                      .toString()),
              trailing: Text(_order.status),
            );
          }),
    );
  }
}

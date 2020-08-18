import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:market/Models/Product.dart';

class OrderItem extends StatefulWidget {
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300], offset: Offset(1, 1), blurRadius: 4),
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Image.asset(
              "images/apples.png",
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
                    "name",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text("price",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              width: 80,
            ),
            IconButton(icon: Icon(EvaIcons.trash), onPressed: null)
          ],
        ),
      ),
    );
  }
}

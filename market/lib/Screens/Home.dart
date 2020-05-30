import 'package:flutter/material.dart';
import 'package:market/Widgets/Categories.dart';
import 'package:market/Widgets/Featured.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Let's order some groceries",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(1, 1),
                          blurRadius: 3),
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Find Groceries in Markets",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Featured",
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            ),
            Featured()
          ],
        ),
      ),
    );
  }
}

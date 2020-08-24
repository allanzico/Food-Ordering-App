import 'package:flutter/material.dart';

class NoSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Oops, nothing found here",
            style: TextStyle(
                color: Colors.grey, fontSize: 22, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}

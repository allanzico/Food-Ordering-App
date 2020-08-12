import 'package:flutter/material.dart';

class SmallIconButton extends StatelessWidget {
  final IconData icon;
  const SmallIconButton({Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
              icon,
              size: 16,
              color: Colors.black,
            ),
          ),
        ));
  }
}

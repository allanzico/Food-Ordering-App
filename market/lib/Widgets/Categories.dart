import 'package:flutter/material.dart';
import 'package:market/Models/Category.dart';
import 'package:market/Providers/CategoryProvider.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Widgets/Loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoriesWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoriesWidget({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                width: 100,
                image: NetworkImage(category.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black26),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(category.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))))
        ],
      ),
    );
  }
}

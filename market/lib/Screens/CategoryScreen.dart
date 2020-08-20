import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Models/Category.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Widgets/PopularMarkets.dart';
import 'package:market/Widgets/PopularProducts.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryScreen({Key key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Text(categoryModel.name),
          Column(
            children: productProvider.productsByCategory.map((item) {
              return GestureDetector(
                  onTap: () {
                    // changeScreen(context, widget);
                  },
                  child: PopularProductsWidget());
            }).toList(),
          ),
        ],
      )),
    );
  }
}
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Widgets/NoSearchWidget.dart';
import 'package:market/Widgets/ProductsWidget.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Products",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(EvaIcons.shoppingBag), onPressed: null)
        ],
      ),
      body: productProvider.filteredProducts.length < 1
          ? NoSearchWidget()
          : ListView.builder(
              itemCount: productProvider.filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductWidget(
                  product: productProvider.filteredProducts[index],
                );
              }),
    );
  }
}

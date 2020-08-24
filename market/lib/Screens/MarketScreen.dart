import 'package:flutter/material.dart';
import 'package:market/Models/Market.dart';
import 'package:market/Providers/ProductProvider.dart';

import 'package:market/Widgets/ProductsWidget.dart';
import 'package:provider/provider.dart';

class MarketScreen extends StatelessWidget {
  final MarketModel marketModel;

  const MarketScreen({Key key, this.marketModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Text(marketModel.name),
          Column(
            children: productProvider.productsByMarket.map((item) {
              return GestureDetector(
                  onTap: () {
                    // changeScreen(context, widget);
                  },
                  child: ProductsWidget());
            }).toList(),
          ),
        ],
      )),
    );
  }
}

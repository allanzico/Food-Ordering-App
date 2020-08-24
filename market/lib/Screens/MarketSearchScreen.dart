import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Providers/MarketProvider.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Screens/MarketScreen.dart';

import 'package:market/Widgets/MarketsWidget.dart';
import 'package:market/Widgets/NoSearchWidget.dart';

import 'package:provider/provider.dart';

class MarketSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final marketProvider = Provider.of<MarketProvider>(context);
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
          "Markets",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(EvaIcons.shoppingBag), onPressed: null)
        ],
      ),
      body: marketProvider.filteredMarkets.length < 1
          ? NoSearchWidget()
          : ListView.builder(
              itemCount: marketProvider.filteredMarkets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    await productProvider.loadProductsByMarket(
                        marketId: marketProvider.filteredMarkets[index].id);
                    changeScreen(
                        context,
                        MarketScreen(
                          marketModel: marketProvider.filteredMarkets[index],
                        ));
                  },
                  child: MarketsWidget(
                    market: marketProvider.filteredMarkets[index],
                  ),
                );
              }),
    );
  }
}

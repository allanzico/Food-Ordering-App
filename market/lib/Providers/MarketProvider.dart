import 'package:flutter/material.dart';
import 'package:market/Helpers/CategoryService.dart';
import 'package:market/Helpers/MarketService.dart';

import 'package:market/Models/Market.dart';

class MarketProvider with ChangeNotifier {
  MarketService _marketService = MarketService();
  List<MarketModel> markets = [];
  List<MarketModel> filteredMarkets = [];
  MarketModel market;

  MarketProvider.initialize() {
    _loadMarkets();
    filterMarkets();
  }

  //Load Markets to List
  Future _loadMarkets() async {
    markets = await _marketService.getMarkets();
    notifyListeners();
  }

  //Load Single Market
  loadSingleMarket({String marketId}) async {
    market = await _marketService.getMarketsById(mareketId: marketId);
    // return market;
    notifyListeners();
  }

  //Filter Markets
  Future filterMarkets({String marketName}) async {
    filteredMarkets =
        await _marketService.filterMarkets(marketName: marketName);
    print(filteredMarkets.length);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:market/Helpers/CategoryService.dart';
import 'package:market/Helpers/MarketService.dart';

import 'package:market/Models/Market.dart';

class MarketProvider with ChangeNotifier {
  MarketService _marketService = MarketService();
  List<MarketModel> markets = [];

  MarketProvider.initialize() {
    _loadMarkets();
  }

  //Load Markets to List
  Future _loadMarkets() async {
    markets = await _marketService.getMarkets();
    notifyListeners();
  }
}

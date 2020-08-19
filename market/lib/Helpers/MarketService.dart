import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/Models/Market.dart';

class MarketService {
  String collection = "markets";
  Firestore _firestore = Firestore.instance;

//Fetch categories
  Future<List<MarketModel>> getMarkets() async {
    List<MarketModel> markets = [];
    _firestore.collection(collection).getDocuments().then((result) {
      for (DocumentSnapshot market in result.documents) {
        markets.add(MarketModel.fromSnapshot(market));
      }
    });
    return markets;
  }
}

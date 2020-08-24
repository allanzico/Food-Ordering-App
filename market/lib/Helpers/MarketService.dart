import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/Models/Market.dart';

class MarketService {
  String collection = "markets";
  Firestore _firestore = Firestore.instance;

//Fetch Markets
  Future<List<MarketModel>> getMarkets() async {
    List<MarketModel> markets = [];
    _firestore.collection(collection).getDocuments().then((result) {
      for (DocumentSnapshot market in result.documents) {
        markets.add(MarketModel.fromSnapshot(market));
      }
    });
    return markets;
  }

//Fetch Markets by ID
  Future<MarketModel> getMarketsById({String mareketId}) async {
    _firestore
        .collection(collection)
        .document(mareketId)
        .get()
        .then((doc) => MarketModel.fromSnapshot(doc));
  }

  //Filter Markets

  Future<List<MarketModel>> filterMarkets({String marketName}) {
    List<MarketModel> markets = [];
    String toLowerCase = marketName.toLowerCase();
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([toLowerCase])
        .endAt([toLowerCase + '\uf8ff'])
        .getDocuments()
        .then((result) {
          for (DocumentSnapshot market in result.documents) {
            markets.add(MarketModel.fromSnapshot(market));
          }
          return markets;
        });
  }
}

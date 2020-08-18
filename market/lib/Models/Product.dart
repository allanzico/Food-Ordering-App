import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const RATING = "rating";
  static const NUMBER_OF_RATINGS = "numberOfRatings";
  static const MARKET_ID = "marketId";
  static const MARKET = "market";
  static const CATEGORY = "category";
  static const PRICE = "price";
  static const ISFEATURED = "isFeatured";

//Private variables
  String _id;
  String _name;
  String _image;
  double _rating;
  int _numberOfRatings;
  int _price;
  String _marketId;
  String _market;
  String _category;
  bool _isFeatured;

  //getters
  String get id => _id;
  String get name => _name;
  String get image => _image;
  double get rating => _rating;
  int get numberOfRates => _numberOfRatings;
  int get price => _price;
  String get marketId => _marketId;
  String get market => _market;
  String get category => _category;
  bool get isFeatured => _isFeatured;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _price = snapshot.data[PRICE];
    _rating = snapshot.data[RATING];
    _numberOfRatings = snapshot.data[NUMBER_OF_RATINGS];
    _marketId = snapshot.data[MARKET_ID];
    _market = snapshot.data[MARKET];
    _category = snapshot.data[CATEGORY];
    _isFeatured = snapshot.data[ISFEATURED];
  }
}

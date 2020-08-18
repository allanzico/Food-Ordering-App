import 'package:cloud_firestore/cloud_firestore.dart';

class MarketModel {
  static const ID = "id";
  static const NAME = "name";
  static const AVERAGE_PRICE = "averagePrice";
  static const RATING = "rating";
  static const NUMBER_OF_RATINGS = "numberOfRatings";
  static const IMAGE = "image";
  static const ISPOPULAR = "isPopular";

  //Private variables
  String _id;
  String _name;
  String _image;
  double _averagePrice;
  bool _isPopular;
  double _rating;
  int _numberOfRatings;

  //getters
  String get name => _name;
  double get averagePrice => _averagePrice;
  String get id => _id;
  String get image => _image;
  double get status => _rating;
  int get numberOfRates => _numberOfRatings;
  bool get price => _isPopular;

  MarketModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _averagePrice = snapshot.data[AVERAGE_PRICE];
    _rating = snapshot.data[RATING];
    _image = snapshot.data[IMAGE];
    _numberOfRatings = snapshot.data[NUMBER_OF_RATINGS];
    _isPopular = snapshot.data[ISPOPULAR];
  }
}

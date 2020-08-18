import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItemModel {
  static const ID = "id";
  static const NAME = "name";
  static const PRODUCT_ID = "productId";
  static const AMOUNT = "price";
  static const IMAGE = "image";
  static const QUANTITY = "status";

  //Private variables
  String _id;
  String _name;
  String _image;
  String _productId;
  int _amount;
  int _quantity;

  //getters
  String get name => _name;
  String get image => _image;
  String get productId => _productId;
  String get id => _id;
  int get status => _quantity;
  int get amount => _amount;

  OrderItemModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _productId = snapshot.data[PRODUCT_ID];
    _image = snapshot.data[IMAGE];
    _amount = snapshot.data[AMOUNT];
    _quantity = snapshot.data[QUANTITY];
  }
}

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

  OrderItemModel.fromMap(Map data) {
    _id = data[ID];
    _name = data[NAME];
    _productId = data[PRODUCT_ID];
    _image = data[IMAGE];
    _amount = data[AMOUNT];
    _quantity = data[QUANTITY];
  }

  Map toMap() => {
        ID: _id,
        NAME: _name,
        IMAGE: _image,
        PRODUCT_ID: _productId,
        AMOUNT: _amount,
        QUANTITY: _quantity
      };
}

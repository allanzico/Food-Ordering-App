import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const PRODUCT_ID = "productId";
  static const USER_ID = "userId";
  static const AMOUNT = "amount";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  //Private variables
  String _id;
  String _description;
  String _productId;
  int _amount;
  String _status;
  String _userId;
  int _createdAt;

  //getters
  String get description => _description;
  String get productId => _productId;
  String get userId => _userId;
  String get id => _id;
  String get status => _status;
  int get amount => _amount;
  int get createdAt => _createdAt;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _description = snapshot.data[DESCRIPTION];
    _productId = snapshot.data[PRODUCT_ID];
    _amount = snapshot.data[AMOUNT];
    _status = snapshot.data[STATUS];
    _createdAt = snapshot.data[CREATED_AT];
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL_PRICE = "totalPrice";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  //Private variables
  String _id;
  String _description;

  int _totalPrice;
  String _status;
  String _userId;
  int _createdAt;

//Public variables
  List cart;
  //getters
  String get description => _description;

  String get userId => _userId;
  String get id => _id;
  String get status => _status;
  int get totalPrice => _totalPrice;
  int get createdAt => _createdAt;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _userId = snapshot.data[USER_ID];
    _description = snapshot.data[DESCRIPTION];
    cart = snapshot.data[CART];
    _totalPrice = snapshot.data[TOTAL_PRICE];
    _status = snapshot.data[STATUS];
    _createdAt = snapshot.data[CREATED_AT];
  }
}

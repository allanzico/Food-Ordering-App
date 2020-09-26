import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/Models/OrderItem.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  // static const FAVORITES = "favorites";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";

//Private variables
  String _name;
  String _email;
  String _id;
  String _stripeId;
  int _priceSum = 0;
  int _quantitySum = 0;
  // List _cart;

  //Public variables
  List cart;
  int totalCartPrice;

  // List _favorites;

  //getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;
  // List get cart => _cart;
  // List get favorites => _favorites;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    _stripeId = snapshot.data[STRIPE_ID];
    cart = snapshot.data[CART] ?? [];
    totalCartPrice = getTotalPrice(cart: snapshot.data[CART]);

    // cart = _convertCart(snapshot.data[CART]) ?? [];
    // _favorites = snapshot.data[FAVORITES] ?? [];
  }

  // get total cart price
  int getTotalPrice({List cart}) {
    if (cart == null) {
      return 0;
    } else {
      for (Map cartItem in cart) {
        _priceSum += cartItem['amount'];
      }
    }

    return _priceSum;
  }

  //Convert cart Items
  List<OrderItemModel> _convertCart(List<Map> cart) {
    List<OrderItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(OrderItemModel.fromMap(cartItem));
    }

    return convertedCart;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market/Helpers/OrderService.dart';
import 'package:market/Helpers/UserService.dart';
import 'package:market/Models/Order.dart';
import 'package:market/Models/OrderItem.dart';
import 'package:market/Models/Product.dart';
import 'package:market/Models/User.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Authenticated, UnAuthenticated, Authenticating }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  FirebaseUser _user;
  UserService _userServices = UserService();
  OrderService _orderService = OrderService();
  UserModel _userModel;

//Public variables
  List<OrderModel> orders = [];

  //getters
  Status get status => _status;
  FirebaseAuth get auth => _auth;
  Firestore get firestore => _firestore;
  UserModel get userModel => _userModel;

  FirebaseUser get user => _user;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

//constructor
  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }
//get User ID

  //get user
  Future<void> getUser() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  //User signin
  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

//Get Order
  getOrders() async {
    orders = await _orderService.getUserOrders(userId: user.uid);
    print(orders);
    notifyListeners();
  }
  //User signup

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((user) {
        Map<String, dynamic> userData = {
          "email": email.text,
          "firstName": firstName.text,
          "lastName": lastName.text,
          "id": user.user.uid,
          "favorites": [],
          "cart": []
        };
        _userServices.createUser(userData);
      });
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      AuthResult result = await _auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((user) {
        Map<String, dynamic> userData = {
          "email": email,
          "firstName": firstName.text,
          "lastName": lastName.text,
          "id": user.user.uid,
          "favorites": [],
          "cart": []
        };
        _userServices.createUser(userData);
      });
      FirebaseUser user = result.user;
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //User signout
  Future<void> signOut() {
    _auth.signOut();
    _status = Status.UnAuthenticated;
    notifyListeners();
  }

  //Add items to cart
  Future<bool> addToCart({ProductModel product, int quantity}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();

      Map cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.image,
        "productId": product.id,
        "amount": product.price * quantity,
        "quantity": quantity
      };

      OrderItemModel item = OrderItemModel.fromMap(cartItem);
      _userServices.addToCart(userId: user.uid, cartItem: item);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  //Remove items from cart
  Future<bool> removeFromCart({Map cartItem}) async {
    try {
      _userServices.removeFromCart(userId: user.uid, cartItem: cartItem);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

//Empty cart after ordering
  Future<bool> emptyCart() async {
    try {
      _userServices.emptyCart(userId: user.uid);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

//Clear text fields
  void clearControllers() {
    email.text = "";
    password.text = "";
    firstName.text = "";
    lastName.text = "";
  }

  //Auth Error message
  bool _onError(String error) {
    _status = Status.UnAuthenticated;
    notifyListeners();
    print("Auth ERROR: " + error.toString());
    return false;
  }

//Listen for auth state
  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.UnAuthenticated;
    } else {
      // firebaseUser = await _auth.currentUser();
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(user.uid);
    }
    notifyListeners();
  }
}

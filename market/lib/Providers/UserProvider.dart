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
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  UserService _userServices = UserService();
  OrderService _orderService = OrderService();
  UserModel _userModel;
  String _userId;

//Public variables
  List<OrderModel> orders = [];

  //getters
  Status get status => _status;
  FirebaseUser get user => _user;
  FirebaseAuth get auth => _auth;
  Firestore get firestore => _firestore;
  UserModel get userModel => _userModel;
  String get userId => _userId;

  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

//constructor
  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
    getUser();
  }
//get User ID

  //get user
  void getUser() async {
    final FirebaseUser firebaseUser = await auth.currentUser();
    _userModel = await _userServices.getUserById(firebaseUser.uid);
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
    final FirebaseUser firebaseUser = await auth.currentUser();
    orders = await _orderService.getUserOrders(userId: firebaseUser.uid);
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
          "name": name.text,
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

  //User signout
  Future<void> signOut() {
    _auth.signOut();
    _status = Status.UnAuthenticated;
    notifyListeners();
  }

  //Add items to cart
  Future<bool> addToCart({ProductModel product, int quantity}) async {
    final FirebaseUser firebaseUser = await auth.currentUser();
    final userId = firebaseUser.uid;
    _userModel = await _userServices.getUserById(firebaseUser.uid);
    // try {
    var uuid = Uuid();
    String cartItemId = uuid.v4();
    List cart = _userModel.cart;
//    bool itemExists = false;
    Map cartItem = {
      "id": cartItemId,
      "name": product.name,
      "image": product.image,
      "productId": product.id,
      "amount": product.price * quantity,
      "quantity": quantity
    };

    // for (Map item in cart) {
    //   if (item["productId"] == cartItem["productId"]) {
    //     item["quantity"] += item["quantity"];
    //     itemExists = true;
    //     break;
    //   }
    // }
//    if (!itemExists) {
    OrderItemModel item = OrderItemModel.fromMap(cartItem);
    _userServices.addToCart(userId: userId, cartItem: item);
    //itemExists = true;
    print("USER: $firebaseUser");
    print("CART ITEMS ARE: $cart");
//    }
    // print(_user);
    // print(cart);
    return true;
    // } catch (e) {
    //   print(e);
    //   return false;
    // }
  }

  //Remove items from cart
  Future<bool> removeFromCart({OrderItemModel cartItem}) async {
    final FirebaseUser firebaseUser = await auth.currentUser();
    final userId = firebaseUser.uid;
    // _userModel = await _userServices.getUserById(firebaseUser.uid);
    try {
      _userServices.removeFromCart(userId: userId, cartItem: cartItem);

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
    name.text = "";
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
    if (user == null) {
      _status = Status.UnAuthenticated;
    } else {
      firebaseUser = await _auth.currentUser();
      _status = Status.Authenticated;
      // _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }
}

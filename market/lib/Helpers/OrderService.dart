import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/Models/Order.dart';
import 'package:market/Models/User.dart';

class OrderService {
  //define user table
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  //Create new order
  void createOrder(
      {String userId,
      String id,
      String description,
      String status,
      List cart,
      int totalPrice}) {
    _firestore.collection(collection).document(id).setData({
      "userId": userId,
      "id": id,
      "cart": cart,
      "totalPrice": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "description": description,
      "status": status
    });
  }

  //Get user Orders
  Future<List<OrderModel>> getUserOrders({String userId}) async {
    List<OrderModel> orders = [];
    await _firestore
        .collection(collection)
        .where("userId", isEqualTo: userId)
        .getDocuments()
        .then((result) {
      for (DocumentSnapshot order in result.documents) {
        orders.add(OrderModel.fromSnapshot(order));
      }
    });
    return orders;
  }
}

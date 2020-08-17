import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/Models/User.dart';

class UserService {
  //define user table
  String collection = "users";
  Firestore _firestore = Firestore.instance;
  Map<String, dynamic> userData;

  //Create new user
  void createUser(userData) {
    _firestore
        .collection(collection)
        .document(userData["id"])
        .setData(userData);
  }

  //Update user
  void updateUser(userData) {
    _firestore
        .collection(collection)
        .document(userData["id"])
        .updateData(userData);
  }

  //Get single user
  Future<UserModel> getUserById(String id) {
    _firestore.collection(collection).document(id).get().then((doc) {
      return UserModel.fromSnapshot(doc);
    });
  }
}

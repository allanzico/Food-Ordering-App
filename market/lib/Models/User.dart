import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  static const FAVORITES = "favorites";

//Private variables
  String _name;
  String _email;
  String _id;
  List _favorites;

  //getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  List get favorites => _favorites;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    _favorites = snapshot.data[FAVORITES] ?? [];
  }
}

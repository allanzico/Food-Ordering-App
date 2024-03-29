import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/Models/Category.dart';

class CategoryService {
  String collection = "categories";
  Firestore _firestore = Firestore.instance;

//Fetch categories
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];
    _firestore.collection(collection).getDocuments().then((result) {
      for (DocumentSnapshot category in result.documents) {
        categories.add(CategoryModel.fromSnapshot(category));
      }
    });
    return categories;
  }
}

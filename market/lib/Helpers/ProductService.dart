import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/Models/Product.dart';

class ProductService {
  String collection = "products";
  Firestore _firestore = Firestore.instance;

//Fetch Products
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];
    _firestore.collection(collection).getDocuments().then((result) {
      for (DocumentSnapshot product in result.documents) {
        products.add(ProductModel.fromSnapshot(product));
      }
    });
    return products;
  }
}

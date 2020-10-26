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

  //Fetch Products by category
  Future<List<ProductModel>> getProductsByCategory({String category}) async {
    List<ProductModel> products = [];
    await _firestore
        .collection(collection)
        .where("category", isEqualTo: category)
        .getDocuments()
        .then((result) {
      for (DocumentSnapshot product in result.documents) {
        products.add(ProductModel.fromSnapshot(product));
      }
    });
    return products;
  }

  //Fetch Products by Market
  Future<List<ProductModel>> getProductsByMarket({String marketId}) async {
    List<ProductModel> products = [];
    await _firestore
        .collection(collection)
        .where("marketId", isEqualTo: marketId)
        .getDocuments()
        .then((result) {
      for (DocumentSnapshot product in result.documents) {
        products.add(ProductModel.fromSnapshot(product));
      }
    });
    return products;
  }

  //Filter products

  Future<List<ProductModel>> filterProducts({String productName}) {
    String toLowerCase = productName.toLowerCase();
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([toLowerCase])
        .endAt([toLowerCase + '\uf8ff'])
        .getDocuments()
        .then((result) {
          List<ProductModel> products = [];
          for (DocumentSnapshot product in result.documents) {
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
        });
  }
}

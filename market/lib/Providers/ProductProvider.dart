import 'package:flutter/material.dart';
import 'package:market/Helpers/ProductService.dart';
import 'package:market/Models/Product.dart';

class ProductProvider with ChangeNotifier {
  ProductService _productService = ProductService();
  List<ProductModel> products = [];

  ProductProvider.initialize() {
    _loadProducts();
  }

  //Load products to List
  Future _loadProducts() async {
    products = await _productService.getProducts();
    notifyListeners();
  }
}

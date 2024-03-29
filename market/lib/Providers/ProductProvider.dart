import 'package:flutter/material.dart';
import 'package:market/Helpers/ProductService.dart';
import 'package:market/Models/Product.dart';

class ProductProvider with ChangeNotifier {
  ProductService _productService = ProductService();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByMarket = [];
  List<ProductModel> filteredProducts = [];

  ProductProvider.initialize() {
    _loadProducts();
    filterProducts();
    print(products);
  }

  //Private method Load products to List
  Future _loadProducts() async {
    products = await _productService.getProducts();
    notifyListeners();
  }

  //public method to Load products to List by category
  Future loadProductsByCategory({String categoryName}) async {
    productsByCategory =
        await _productService.getProductsByCategory(category: categoryName);
    notifyListeners();
  }

  //public method Load products to List by market
  Future loadProductsByMarket({String marketId}) async {
    productsByMarket =
        await _productService.getProductsByMarket(marketId: marketId);
    notifyListeners();
  }

  //Filter Products
  Future filterProducts({String productName}) async {
    filteredProducts =
        await _productService.filterProducts(productName: productName);

    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

enum SearchBy { PRODUCTS, MARKETS }

class AppProvider with ChangeNotifier {
  bool isLoading = false;
  SearchBy searchBy = SearchBy.PRODUCTS;
  String filterBy = "Products";
  int totalPrice = 0;
  int priceSum = 0;
  int quantitySum = 0;
  int itemQuantity = 0;

  void changeLoadingState() {
    isLoading = !isLoading;
  }

  void changeSearchBy({SearchBy newSearchBy}) {
    searchBy = newSearchBy;
    if (newSearchBy == SearchBy.PRODUCTS) {
      filterBy = "Products";
    } else {
      filterBy = "Markets";
    }
    notifyListeners();
  }

//get total price
  addPrice({int newPrice}) {
    priceSum += newPrice;
    notifyListeners();
  }

//get total quantity
  addQuantity({int newQuantity}) {
    quantitySum += newQuantity;
    notifyListeners();
  }

//Add up everything
  changeTotalPrice({int newTotal}) {
    totalPrice = newTotal;
    notifyListeners();
  }
}

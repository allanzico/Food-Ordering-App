import 'package:flutter/cupertino.dart';

enum SearchBy { PRODUCTS, MARKETS }

class AppProvider with ChangeNotifier {
  bool isLoading = false;
  SearchBy searchBy = SearchBy.PRODUCTS;
  String filterBy = "Products";

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
}

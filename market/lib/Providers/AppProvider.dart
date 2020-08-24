import 'package:flutter/cupertino.dart';

enum SearchBy { PRODUCTS, MARKETS }

class AppProvider with ChangeNotifier {
  bool isLoading = false;
  SearchBy searchBy = SearchBy.MARKETS;

  void changeLoadingState() {
    isLoading = !isLoading;
  }

  void changeSearchBy(SearchBy newSearchBy) {
    searchBy = newSearchBy;
    notifyListeners();
  }
}

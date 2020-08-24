import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  bool isLoading = false;

  void changeLoadingState() {
    isLoading = !isLoading;
  }
}

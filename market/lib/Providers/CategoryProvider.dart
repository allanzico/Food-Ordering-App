import 'package:flutter/material.dart';
import 'package:market/Helpers/CategoryService.dart';
import 'package:market/Models/Category.dart';

class CategoryProvider with ChangeNotifier {
  CategoryService _categoryService = CategoryService();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize() {
    _loadCategories();
  }

  //Load categories to List
  Future _loadCategories() async {
    categories = await _categoryService.getCategories();
    notifyListeners();
  }
}

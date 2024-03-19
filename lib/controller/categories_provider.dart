import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  String categoryItem = 'General';
  List<String> categoriesList = [
    'General',
    'Entertainment',
    'Health',
    'Sports',
    'Business',
    'Technology'
  ];
  changeCategories(index) {
    categoryItem = categoriesList[index];
    notifyListeners();
  }
}

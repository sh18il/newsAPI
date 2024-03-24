import 'dart:developer';

import 'package:flutter/material.dart';

import '../view/home_sceen.dart';

class HomeScreenProvider extends ChangeNotifier {
  String name = 'bbc-news';
  FilterList? selectedMenu;
  popMenuButton(item) {
    selectedMenu = item;
    switch (selectedMenu) {
      case FilterList.bbcNews:
        name = 'bbc-news';
        break;
      case FilterList.aryNews:
        name = 'ary-news';
        break;
      case FilterList.alJazeera:
        name = 'al-Jazeera-english';
        break;
      case FilterList.cnnNews:
        name = 'cnn';
        break;
      default:
        name = 'bbc-news';
        break;
    }
    log('Selected name: $name');
    notifyListeners();
  }
}

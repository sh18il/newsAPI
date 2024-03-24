import 'package:flutter/material.dart';
import 'package:news_api/models/nwes_hedline.dart';
import 'package:news_api/services/news_repository.dart';

import '../models/categories_news_model.dart';

class ServiceProvider extends ChangeNotifier {
  final rep = NewsRepository();

  Future<NewsChannelHeadLinesModel> fetchNewsChannelHeadLinesApi(
      chanalName) async {
    final reponse = await rep.fetchNewChannelHeadLineApi(chanalName);
    return reponse;
  }

  Future<CategoriesNewsModel> fetchCategoryApi(categoryItem) async {
    final reponse = await rep.fetchCategoryApi(categoryItem);
    return reponse;
  }
}

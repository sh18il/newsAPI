import 'package:news_api/models/nwes_hedline.dart';
import 'package:news_api/services/news_repository.dart';

import '../models/categories_news_model.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelHeadLinesModel> fetchNewsChannelHeadLinesApi(ChanalName) async {
    final reponse = await _rep.fetchNewChannelHeadLineApi(ChanalName);
    return reponse;

  }
  Future<CategoriesNewsModel> fetchCategoryApi(categoryItem) async {
    final reponse = await _rep.fetchCategoryApi(categoryItem);
    return reponse;

  }
}

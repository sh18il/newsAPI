import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:news_api/models/nwes_hedline.dart';

import '../models/categories_news_model.dart';

class NewsRepository {
  Future<NewsChannelHeadLinesModel> fetchNewChannelHeadLineApi(
      String newsName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$newsName&apiKey=73a31e802dae4b5a88f5ef85ebf87b34';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return NewsChannelHeadLinesModel.fromJson(body);
    }
    throw Exception('Erorr');
  }

  Future<CategoriesNewsModel> fetchCategoryApi(categoryItem) async {
    String url =
        'https://newsapi.org/v2/everything?q=$categoryItem&apiKey=73a31e802dae4b5a88f5ef85ebf87b34';

    final response = await http.get(Uri.parse(url));

    log(response.body);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Erorr');
  }
}

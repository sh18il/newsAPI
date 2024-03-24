import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_api/models/nwes_hedline.dart';
import 'package:news_api/services/constant/secrets.dart';

import '../models/categories_news_model.dart';

class NewsRepository {
  Future<NewsChannelHeadLinesModel> fetchNewChannelHeadLineApi(
      String newsName) async {
    String url =
        '${SecretsChanelApi().api}=$newsName&${SecretsChanelApi().key}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return NewsChannelHeadLinesModel.fromJson(body);
    }
    throw Exception('Erorr');
  }

  Future<CategoriesNewsModel> fetchCategoryApi(categoryItem) async {
    String url =
        '${SecretsCategoryApi().api}=$categoryItem&${SecretsCategoryApi().key}';

    final response = await http.get(Uri.parse(url));

    log(response.body);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Erorr');
  }
}

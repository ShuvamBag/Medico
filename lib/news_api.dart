import 'dart:convert';

import 'package:http/http.dart' as http;

import 'news_model.dart';
class News {
  List<NewsApiModel> news = [];

  Future<void> getNews() async {
    Uri uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=870037a8a384410e9203c82901c4b3b4');

    final response = await http.get(uri);

    var jsondata = jsonDecode(response.body);
    if (jsondata['status'] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          NewsApiModel newsApiModel = NewsApiModel(
            title: element['title'] ?? "",
            description: element['description'] ?? "",
            content: element['content'] ?? "",
            imageUrl: element['urlToImage'] ?? "",
          );
          news.add(newsApiModel);
        }
      });
    }
  }
}

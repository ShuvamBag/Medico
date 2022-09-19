import 'dart:convert';

import 'package:http/http.dart' as http;

import 'news_model.dart';

Future<List<NewsApiModel>> getNews() async {
  Uri uri = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=870037a8a384410e9203c82901c4b3b4');

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);

    List articalsList = map['articles'];

    List<NewsApiModel> newsList = articalsList
        .map((jsonData) => NewsApiModel.fromJson(jsonData))
        .toList();

    return newsList;
  } else {
    print("error");
    return [];
  }
}

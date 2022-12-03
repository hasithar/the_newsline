import 'dart:convert';

import 'package:the_newsline/models/news.model.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsModel> news = [];

  Future<void> getNews() async {
    String newsUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=511b2947536d4aa087a6621cccd61f68";

    var res  = await http.get(Uri.parse(newsUrl));
    var data = jsonDecode(res.body);

    if(data['status'] == "ok") {
      data['articles'].forEach((article) {
        NewsModel model = NewsModel(
            newsAuthor: article['author'],
            newsTitle: article['title'],
            newsExcerpt: article['description'],
            newsDescription: article['content'],
            newsUrl: article['url'],
            newsImageUrl: article['urlToImage'],
            newsPublishedAt: article['publishedAt']
        );

        news.add(model);
      });
    }
  }



}
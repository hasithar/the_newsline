import 'package:the_newsline/models/news.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:the_newsline/constants/api.constanst.dart' as api_constants;

class News {
  final String apiHost = api_constants.host;
  final String apiVersion = api_constants.version;
  final String apiKey = api_constants.apiKey;
  final String? apiPath;
  String? category;
  int? pageSize;
  String? source;
  static const String language = "en";

  List<NewsModel> news = [];

  News({
    this.apiPath,
    this.category,
    this.pageSize,
    this.source,
  }) ;

  Future<void> getNews() async {
    String newsUrl = "";

    if(source!.isNotEmpty) {
      newsUrl = "$apiHost/$apiVersion/$apiPath?language=$language&sources=$source&pageSize=$pageSize&apiKey=$apiKey";
    } else {
      newsUrl = "$apiHost/$apiVersion/$apiPath?language=$language&category=$category&pageSize=$pageSize&apiKey=$apiKey";
    }

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
            newsPublishedAt: article['publishedAt'],
            newsSource: article['source']['name']
        );

        news.add(model);
      });
    }
  }
}
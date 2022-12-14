import "package:the_newsline/models/news_source.model.dart";

List<NewsSourceModel> getNewsSources() {
  List<NewsSourceModel> source = <NewsSourceModel>[];

  NewsSourceModel model = NewsSourceModel();
  model.sourceName = "ABC News";
  model.sourceSlug = "abc-news";
  model.sourceLogo = "https://images.unsplash.com/photo-1670067974780-79d187bf7246?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Al Jazeera";
  model.sourceSlug = "al-jazeera-english";
  model.sourceLogo = "https://images.unsplash.com/photo-1670067974780-79d187bf7246?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  source.add(model);

  return source;
}
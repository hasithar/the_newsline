import "package:the_newsline/models/news_source.model.dart";

List<NewsSourceModel> getNewsSources() {
  List<NewsSourceModel> source = <NewsSourceModel>[];

  NewsSourceModel model = NewsSourceModel();
  model.sourceName = "ABC News";
  model.sourceSlug = "abc-news";
  model.sourceLogo = "abc_news.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Associated Press";
  model.sourceSlug = "associated-press";
  model.sourceLogo = "ap.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "BBC News";
  model.sourceSlug = "bbc-news";
  model.sourceLogo = "bbc_news.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "BBC Sport";
  model.sourceSlug = "bbc-sport";
  model.sourceLogo = "bbc_sport.png";
  source.add(model);

  // model = NewsSourceModel();
  // model.sourceName = "Bloomberg";
  // model.sourceSlug = "bloomberg";
  // model.sourceLogo = "bloomberg.png";
  // source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Business Insider";
  model.sourceSlug = "business-insider";
  model.sourceLogo = "business_insider.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Buzzfeed";
  model.sourceSlug = "buzzfeed";
  model.sourceLogo = "buzz.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "CNN";
  model.sourceSlug = "cnn";
  model.sourceLogo = "cnn.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Engadget";
  model.sourceSlug = "engadget";
  model.sourceLogo = "engadget.png";
  source.add(model);

  // model = NewsSourceModel();
  // model.sourceName = "ESPN";
  // model.sourceSlug = "espn";
  // model.sourceLogo = "espn.png";
  // source.add(model);

  // model = NewsSourceModel();
  // model.sourceName = "ESPN Cric Info";
  // model.sourceSlug = "espn-cric-info";
  // model.sourceLogo = "espn_cricinfo.png";
  // source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Fox News";
  model.sourceSlug = "fox-news";
  model.sourceLogo = "fox_news.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Hacker News";
  model.sourceSlug = "hacker-news";
  model.sourceLogo = "thn.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "IGN";
  model.sourceSlug = "ign";
  model.sourceLogo = "ign.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Mashable";
  model.sourceSlug = "mashable";
  model.sourceLogo = "mashable.png";
  source.add(model);

  // model = NewsSourceModel();
  // model.sourceName = "MTV News";
  // model.sourceSlug = "mtv-news";
  // model.sourceLogo = "mtv_news.png";
  // source.add(model);

  // model = NewsSourceModel();
  // model.sourceName = "National Geographic";
  // model.sourceSlug = "national-geographic";
  // model.sourceLogo = "ng.png";
  // source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Newsweek";
  model.sourceSlug = "newsweek";
  model.sourceLogo = "newsweek.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Recode";
  model.sourceSlug = "recode";
  model.sourceLogo = "recode.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "TechCrunch";
  model.sourceSlug = "techcrunch";
  model.sourceLogo = "tc.png";
  source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Reuters";
  model.sourceSlug = "reuters";
  model.sourceLogo = "thomson.png";
  source.add(model);

  // model = NewsSourceModel();
  // model.sourceName = "The Verge";
  // model.sourceSlug = "the-verge";
  // model.sourceLogo = "vt.png";
  // source.add(model);

  model = NewsSourceModel();
  model.sourceName = "Wall Street Journal";
  model.sourceSlug = "the-wall-street-journal";
  model.sourceLogo = "wsj.png";
  source.add(model);

  return source;
}



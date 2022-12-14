import 'package:flutter/material.dart';
import 'package:the_newsline/helpers/news_source.helper.dart';
import 'package:the_newsline/helpers/news.helper.dart';
import 'package:the_newsline/models/news_source.model.dart';
import 'package:the_newsline/models/news.model.dart';
import 'package:the_newsline/widgets/news_source_card.widget.dart';
import 'package:the_newsline/widgets/news_card.widget.dart';
import 'package:the_newsline/widgets/news_top_story_card.widget.dart';
import 'package:the_newsline/widgets/bottom_navigation.widget.dart';

class NewsSource extends StatefulWidget {
  final String sourceName;
  final String sourceSlug;
  final String? sourceLogo;

  const NewsSource({
    Key? key,
    required this.sourceName,
    required this.sourceSlug,
    required this.sourceLogo
  }) : super(key: key);

  @override
  State<NewsSource> createState() => _NewsSourceState();
}

class _NewsSourceState extends State<NewsSource> {
  List<NewsSourceModel> newsSources = <NewsSourceModel>[];
  List<NewsModel> newsArticles = <NewsModel>[];
  List<NewsModel> newsArticlesTopStories = <NewsModel>[];
  bool isNewsFetching = true;
  bool isTopStoriesFetching = true;
  String sourceName = "";
  String sourceSlug = "";
  String sourceLogo = "";

  @override
  void initState() {
    super.initState();
    newsSources = getNewsSources();
    sourceName = widget.sourceName;
    sourceSlug = widget.sourceSlug;
    getNewsArticles();
    getTopStories();
  }

  getTopStories() async {
    News topStories = News(
        apiPath: "top-headlines",
        source: sourceSlug,
        pageSize: 5
    );
    await topStories.getNews();
    newsArticlesTopStories = topStories.news;
    setState(() {
      isTopStoriesFetching = false;
    });
  }

  getNewsArticles() async {
    News news = News(
        apiPath: "top-headlines",
        source: sourceSlug
    );
    await news.getNews();
    newsArticles = news.news;
    newsArticles.removeRange(0, 5);
    setState(() {
      isNewsFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${sourceName.toUpperCase()}", style: const TextStyle(
              fontWeight: FontWeight.w700
          ),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 85,
                child: ListView.builder(
                    itemCount: newsSources.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return NewsSourceCard(
                        sourceName: newsSources[i].sourceName,
                        sourceSlug: newsSources[i].sourceSlug,
                        sourceLogo: newsSources[i].sourceLogo,
                        isActive: newsSources[i].sourceSlug == sourceSlug ? true : false,
                      );
                    }),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Top Stories from $sourceName", style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 21, 69, 1)
                      )),
                    ),
                  ],
                ),
              ),

              isTopStoriesFetching ?
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 94),
                child: const CircularProgressIndicator(
                  color: Colors.redAccent,
                  backgroundColor: Color.fromRGBO(0, 21, 69, 1),
                ),
              ) :
              SizedBox(
                height: 224,
                child: ListView.builder(
                  itemCount: newsArticlesTopStories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return NewsTopStoryCard(
                      newsTitle: newsArticlesTopStories[i].newsTitle,
                      newsImageUrl: newsArticlesTopStories[i].newsImageUrl,
                      newsUrl: newsArticlesTopStories[i].newsUrl,
                    );
                  },
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("$sourceName Latest Updates", style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 21, 69, 1)
                      )),
                    ),
                  ],
                ),
              ),

              isNewsFetching ?
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 94),
                child: const CircularProgressIndicator(
                  color: Colors.redAccent,
                  backgroundColor: Color.fromRGBO(0, 21, 69, 1),
                ),
              ) :
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: ListView.builder(
                  itemCount: newsArticles.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return NewsCard(
                        newsTitle: newsArticles[i].newsTitle,
                        newsExcerpt: newsArticles[i].newsExcerpt,
                        newsImageUrl: newsArticles[i].newsImageUrl,
                        newsUrl: newsArticles[i].newsUrl,
                        newsSource: newsArticles[i].newsSource,
                        newsPublishedAt: newsArticles[i].newsPublishedAt
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigation()
    );
  }
}

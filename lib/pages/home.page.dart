import 'package:flutter/material.dart';
import 'package:the_newsline/helpers/news.helper.dart';
import 'package:the_newsline/helpers/news_category.helper.dart';
import 'package:the_newsline/models/news_category.model.dart';
import 'package:the_newsline/models/news.model.dart';
import 'package:the_newsline/widgets/news_card.widget.dart';
import 'package:the_newsline/widgets/news_category_card.widget.dart';
import 'package:the_newsline/widgets/news_top_story_card.widget.dart';
import 'package:the_newsline/widgets/bottom_navigation.widget.dart';
import 'package:the_newsline/widgets/nav_drawer.widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsCategoryModel> newsCategories = <NewsCategoryModel>[];
  List<NewsModel> newsArticles = <NewsModel>[];
  List<NewsModel> newsArticlesTopStories = <NewsModel>[];
  bool isNewsFetching = true;
  bool isTopStoriesFetching = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsCategories = getNewsCategories();
    getTopStories();
    getNewsArticles();
  }

  getTopStories() async {
    News topStories = News(
      apiPath: "top-headlines",
      category: "",
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
      category: ""
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
        title: const Text("The NewsLine"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                  itemCount: newsCategories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                return NewsCategoryCard(
                  categoryName: newsCategories[i].categoryName,
                  categorySlug: newsCategories[i].categorySlug,
                );
              }),
            ),
            
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Top Stories", style: TextStyle(
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
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Latest News", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(0, 21, 69, 1)
                    )),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 64,
              child: ListView.builder(
                  itemCount: newsCategories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return NewsCategoryCard(
                      categoryName: newsCategories[i].categoryName,
                      categorySlug: newsCategories[i].categorySlug,
                    );
                  }),
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
      drawer: NavDrawer(
        newsCategories: newsCategories,
      ),
      bottomNavigationBar: const BottomNavigation()
    );
  }
}


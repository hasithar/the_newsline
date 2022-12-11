import 'package:flutter/material.dart';
import 'package:the_newsline/helpers/news.helper.dart';
import 'package:the_newsline/helpers/news_category.helper.dart';
import 'package:the_newsline/models/news_category.model.dart';
import 'package:the_newsline/models/news.model.dart';
import 'package:the_newsline/widgets/news_card.widget.dart';
import 'package:the_newsline/widgets/news_category_card.widget.dart';
import 'package:the_newsline/widgets/news_top_story_card.widget.dart';

class NewsCategory extends StatefulWidget {
  final String categoryName;
  final String categorySlug;

  const NewsCategory({
    Key? key,
    required this.categoryName,
    required this.categorySlug
  }) : super(key: key);

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  List<NewsCategoryModel> newsCategories = <NewsCategoryModel>[];
  List<NewsModel> newsArticles = <NewsModel>[];
  List<NewsModel> newsArticlesTopStories = <NewsModel>[];
  bool isNewsFetching = true;
  bool isTopStoriesFetching = true;
  String categoryName = "";
  String categorySlug = "";

  @override
  void initState() {
    super.initState();
    newsCategories = getNewsCategories();
    categoryName = widget.categoryName;
    categorySlug = widget.categorySlug;
    getNewsArticles();
    getTopStories();
  }

  getTopStories() async {
    News topStories = News(
        apiPath: "top-headlines",
        category: categorySlug
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
        category: categorySlug
    );
    await news.getNews();
    newsArticles = news.news;
    setState(() {
      isNewsFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 64,
              child: ListView.builder(
                  itemCount: newsCategories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return NewsCategoryCard(
                      categoryName: newsCategories[i].categoryName,
                      categorySlug: newsCategories[i].categorySlug,
                      isActive: newsCategories[i].categorySlug == categorySlug ? true : false,
                    );
                  }),
            ),

            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Top $categoryName Stories", style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900
                    )),
                  ),
                ],
              ),
            ),

            isTopStoriesFetching ?
            const CircularProgressIndicator() :
            Container(
              height: 256,
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



            isNewsFetching ?
              const CircularProgressIndicator() :
              Container(
              child: ListView.builder(
                itemCount: newsArticles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, i) {
                  return NewsCard(
                    newsTitle: newsArticles[i].newsTitle,
                    newsExcerpt: newsArticles[i].newsExcerpt,
                    newsImageUrl: newsArticles[i].newsImageUrl,
                    newsUrl: newsArticles[i].newsUrl,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




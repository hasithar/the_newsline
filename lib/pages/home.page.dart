import 'package:flutter/material.dart';
import 'package:the_newsline/helpers/news.helper.dart';
import 'package:the_newsline/helpers/news_category.helper.dart';
import 'package:the_newsline/models/news_category.model.dart';
import 'package:the_newsline/models/news.model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsCategoryModel> newsCategories = <NewsCategoryModel>[];
  List<NewsModel> newsArticles = <NewsModel>[];
  bool isNewsFetching = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsCategories = getNewsCategories();
    getNewsArticles();
  }

  getNewsArticles() async {
    News news = News();
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
        title: const Text("The NewsLine"),
        centerTitle: true,
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
                  categoryThumbUrl: newsCategories[i].categoryThumbUrl,
                );
              }),
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

class NewsCategoryCard extends StatelessWidget {
  final String? categoryName;
  final String? categoryThumbUrl;

  const NewsCategoryCard({
    Key? key,
    this.categoryName,
    this.categoryThumbUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Stack(
        children: [
          Image.network(categoryThumbUrl!, width: 100, height: 100,),
          Text(categoryName!)
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String? newsTitle;
  final String? newsExcerpt;
  final String? newsImageUrl;

  const NewsCard({
    Key? key, 
    this.newsTitle, 
    this.newsExcerpt, 
    this.newsImageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          newsImageUrl != null ? Image.network(newsImageUrl!) : Text("no image"),
          Text(newsTitle!),
          newsExcerpt != null ? Text(newsExcerpt!) : Text("no description")
        ],
      ),
    );
  }
}

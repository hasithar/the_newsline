import 'package:flutter/material.dart';
import 'package:the_newsline/pages/news_single.page.dart';

class NewsCard extends StatelessWidget {
  final String? newsTitle;
  final String? newsExcerpt;
  final String? newsImageUrl;
  final String? newsUrl;

  const NewsCard({
    Key? key,
    this.newsTitle,
    this.newsExcerpt,
    this.newsImageUrl,
    this.newsUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => NewsSingle(newsUrl: newsUrl!)
        )),
      },
      child: Container(
        child: Column(
          children: [
            newsImageUrl != null ? Image.network(newsImageUrl!) : Text("no image"),
            Text(newsTitle!),
            newsExcerpt != null ? Text(newsExcerpt!) : Text("no description")
          ],
        ),
      ),
    );
  }
}

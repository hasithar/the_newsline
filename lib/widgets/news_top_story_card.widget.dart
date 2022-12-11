import 'package:flutter/material.dart';
import 'package:the_newsline/pages/news_single.page.dart';

class NewsTopStoryCard extends StatelessWidget {
  final String? newsTitle;
  final String? newsImageUrl;
  final String? newsUrl;

  const NewsTopStoryCard({
    Key? key,
    this.newsTitle,
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
      child: newsImageUrl != null ? Container(
        margin: const EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(newsImageUrl!, width: 350, height: 200, fit: BoxFit.cover),
            ),
            Container(
              width: 350,
              height: 200,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(8, 8),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text(newsTitle!, style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),),
            )
            // Text(newsTitle!),
          ],
        ),
      ) : Container(),
    );
  }
}



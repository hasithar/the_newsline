import 'package:flutter/material.dart';
import 'package:the_newsline/pages/news_single.page.dart';

class NewsCard extends StatelessWidget {
  final String? newsTitle;
  final String? newsExcerpt;
  final String? newsImageUrl;
  final String? newsUrl;
  final String? newsSource;
  final String? newsPublishedAt;

  const NewsCard({
    Key? key,
    this.newsTitle,
    this.newsExcerpt,
    this.newsImageUrl,
    this.newsUrl,
    this.newsSource,
    this.newsPublishedAt
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => NewsSingle(newsUrl: newsUrl!)
        )),
      },
      child: newsImageUrl != null && newsTitle != null ? Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(newsImageUrl!, width: 150, height: 150, fit: BoxFit.cover,)
            ),
            Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(newsTitle!, style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.grey.shade300,
                          ),
                          padding: const EdgeInsets.all(6),
                          margin: const EdgeInsets.only(left: 16),
                          child: Text(newsSource!),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(newsPublishedAt!.substring(0, 10)),
                        )
                      ],
                    )
                  ],
                )
            ),
          ],
        ),
      ) : Container(),
    );
  }
}

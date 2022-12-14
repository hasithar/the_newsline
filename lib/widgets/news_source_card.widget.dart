import 'package:flutter/material.dart';
import 'package:the_newsline/pages/news_source.page.dart';

class NewsSourceCard extends StatelessWidget {
  final String? sourceName;
  final String? sourceSlug;
  final String? sourceLogo;
  final bool? isActive;

  const NewsSourceCard({
    Key? key,
    this.sourceName,
    this.sourceSlug,
    this.sourceLogo,
    this.isActive
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => NewsSource(
              sourceName: sourceName!,
              sourceSlug: sourceSlug!,
              sourceLogo: sourceLogo!,
            )
        )),
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            Container(
              height: 48,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.075),
                    offset: Offset(5, 2),
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
                color: (isActive ?? false) ? Colors.redAccent :  const Color.fromRGBO(238, 238, 238, 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(sourceName!, style: TextStyle(
                  fontSize: 16,
                  height: 1,
                  color: (isActive ?? false) ? Colors.white :  Colors.black
              ),),
            ),
          ],
        ),
      ),
    );
  }
}








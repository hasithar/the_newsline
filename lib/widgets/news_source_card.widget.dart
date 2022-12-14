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
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(64),
                    child: Image.network(sourceLogo!, width: 64, height: 64, fit: BoxFit.cover,)
                ),
                Container(
                  height: 64,
                  width: 64,
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: (isActive ?? false) ? Colors.red :  Colors.white54,
                      width: 3,
                      style: BorderStyle.solid
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.075),
                        offset: Offset(5, 2),
                        blurRadius: 5,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(64),
                  ),

                ),

              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: Text(sourceName!, style: TextStyle(
                  fontSize: 16,
                  height: 1,
                  color: (isActive ?? false) ? Colors.red :  Colors.black,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}








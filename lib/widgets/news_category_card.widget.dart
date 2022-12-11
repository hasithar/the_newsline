import 'package:flutter/material.dart';
import 'package:the_newsline/pages/news_category.page.dart';

class NewsCategoryCard extends StatelessWidget {
  final String? categoryName;
  final String? categorySlug;
  final bool? isActive;

  const NewsCategoryCard({
    Key? key,
    this.categoryName,
    this.categorySlug,
    this.isActive
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => NewsCategory(
              categoryName: categoryName!,
              categorySlug: categorySlug!,
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
                color: (isActive ?? false) ? Colors.redAccent :  Color.fromRGBO(238, 238, 238, 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(categoryName!, style: TextStyle(
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


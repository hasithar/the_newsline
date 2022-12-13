import 'package:flutter/material.dart';
import 'package:the_newsline/models/news_category.model.dart';
import 'package:the_newsline/pages/news_category.page.dart';

class NavDrawer extends StatelessWidget {
  final List<NewsCategoryModel>? newsCategories;

  const NavDrawer({
    Key? key,
    this.newsCategories
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 21, 69, 1),
            ),
            child: Image.asset('assets/images/logo_white.png'),
          ),
          ListView.builder(
              itemCount: newsCategories?.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, i) {
                var catName = newsCategories![i].categoryName;
                var catSlug = newsCategories![i].categorySlug;
                return ListTile(
                  title: Text(catName!),
                  onTap: () => {
                    Navigator.pop(context),
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => NewsCategory(
                          categoryName: catName,
                          categorySlug: catSlug!,
                        )
                    )),
                  },
                );
              }),
        ],
      ),
    );
  }
}

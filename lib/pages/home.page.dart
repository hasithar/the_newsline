import 'package:flutter/material.dart';
import 'package:the_newsline/helpers/news_category.helper.dart';
import 'package:the_newsline/models/news_category.model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsCategoryModel> newsCategories = <NewsCategoryModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsCategories = getNewsCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The NewsLine"),
        centerTitle: true,
      ),
      body: Container(
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
            )
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

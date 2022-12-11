import 'package:flutter/material.dart';

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


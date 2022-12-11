import "package:the_newsline/models/news_category.model.dart";

List<NewsCategoryModel> getNewsCategories() {
  List<NewsCategoryModel> category = <NewsCategoryModel>[];

  NewsCategoryModel model = NewsCategoryModel();
  model.categoryName = "Business";
  model.categorySlug="business";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Entertainment";
  model.categorySlug = "entertainment";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "General";
  model.categorySlug= "general";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Health";
  model.categorySlug = "health";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Science";
  model.categorySlug = "science";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Sports";
  model.categorySlug = "sports";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Technology";
  model.categorySlug = "technology";
  category.add(model);

  return category;
}
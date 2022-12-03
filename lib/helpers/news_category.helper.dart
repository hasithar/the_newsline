import "package:the_newsline/models/news_category.model.dart";

List<NewsCategoryModel> getNewsCategories() {
  List<NewsCategoryModel> category = <NewsCategoryModel>[];

  NewsCategoryModel model = NewsCategoryModel();
  model.categoryName = "Business";
  model.categoryThumbUrl = "https://source.unsplash.com/random";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Sports";
  model.categoryThumbUrl = "https://source.unsplash.com/random";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Fashion";
  model.categoryThumbUrl = "https://source.unsplash.com/random";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Sports";
  model.categoryThumbUrl = "https://source.unsplash.com/random";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Fashion";
  model.categoryThumbUrl = "https://source.unsplash.com/random";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Sports";
  model.categoryThumbUrl = "https://source.unsplash.com/random";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Fashion";
  model.categoryThumbUrl = "https://source.unsplash.com/random";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Sports";
  model.categoryThumbUrl = "https://source.unsplash.com/random";
  category.add(model);

  model = NewsCategoryModel();
  model.categoryName = "Fashion";
  model.categoryThumbUrl = "https://source.unsplash.com/random";
  category.add(model);

  return category;
}
import '../features/categories/models/category_model.dart';

class FakeData{
  static final List<String>promotions=[
     "assets/banner/banner.png"
  ];
  static final List<CategoryModel>categoriesList=[
      CategoryModel(image: "assets/categories/burger.png",
      name: "burgers"),
       CategoryModel(image: "assets/categories/chicken-leg.png",
      name: "chicken"),
       CategoryModel(image: "assets/categories/cupcake.png",
      name: "dessert"),
       CategoryModel(image: "assets/categories/fried-potatoes.png",
      name: "fries"),
       CategoryModel(image: "assets/categories/pizza.png",
      name: "pizza"),
       CategoryModel(image: "assets/categories/soft-drink.png",
      name: "soft drinks"),
       CategoryModel(image: "assets/categories/soup.png",
      name: "soups"),
       CategoryModel(image: "assets/categories/steak.png",
      name: "steak"),
       CategoryModel(image: "assets/categories/sushi.png",
      name: "sushi"),
       
  ];
}
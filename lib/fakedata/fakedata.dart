import 'package:fooddeliveryappyoutube/features/menu/models/menu_model.dart';

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
  static final List<MenuModel>menu=[
    MenuModel(menuId: "1",
    title: "BBq Pizza Medium",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat pulvinar vehicula. Ut mattis consequat felis, a condimentum nisl eleifend et. Maecenas bibendum vulputate urna.",
    price: 6.99,
    quantity: "700g",
    image: "assets/food/bbqpizza.jpg"),
     MenuModel(menuId: "2",
    title: "BBq Steak",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat pulvinar vehicula. Ut mattis consequat felis, a condimentum nisl eleifend et. Maecenas bibendum vulputate urna.",
    price: 12.99,
    quantity: "500g",
    image: "assets/food/bbqsteak.webp"),
     MenuModel(menuId: "3",
    title: "Chilli Pepper Pizza Large",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat pulvinar vehicula. Ut mattis consequat felis, a condimentum nisl eleifend et. Maecenas bibendum vulputate urna.",
    price: 15.00,
    quantity: "1200g",
    image: "assets/food/chillipepperpizza.webp"),
     MenuModel(menuId: "4",
    title: "Coka Cola",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat pulvinar vehicula. Ut mattis consequat felis, a condimentum nisl eleifend et. Maecenas bibendum vulputate urna.",
    price: 2.00,
    quantity: "300ml",
    image: "assets/food/cocacola.png"),
     MenuModel(menuId: "5",
    title: "Fanta",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat pulvinar vehicula. Ut mattis consequat felis, a condimentum nisl eleifend et. Maecenas bibendum vulputate urna.",
    price: 1.50,
    quantity: "0.33ml",
    image: "assets/food/bbqpizza.jpg"),
     MenuModel(menuId: "6",
    title: "Sushi",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat pulvinar vehicula. Ut mattis consequat felis, a condimentum nisl eleifend et. Maecenas bibendum vulputate urna.",
    price: 9.00,
    quantity: "700g",
    image: "assets/food/sushi.jpg"),

  ];

}
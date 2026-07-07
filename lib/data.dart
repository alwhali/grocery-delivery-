import 'package:grocery_delivery_app/model.dart';

List<String> banners = [
  "assets/banners/Slider1.png",
  "assets/banners/Slider2.png",
  "assets/banners/Slider3.png",
];
List<CategoryModel> categoryList = [
  CategoryModel(name: "Beverages", image: "assets/category/Beverages.png"),
  CategoryModel(name: "Fruits", image: "assets/category/Fruits.png"),
  CategoryModel(name: "Laundry", image: "assets/category/Laundry.png"),
  CategoryModel(name: "Milk & egg", image: "assets/category/Milk & egg.png"),
  CategoryModel(name: "Vegetable", image: "assets/category/Vegetable.png"),
];
List<fruitModel> fruitList = [
  fruitModel(
    name: EnumFruits.banana,
    image: "assets/fruits/banana.png",
    price: "3.99",
    rating: "5.0",
    ratingPrice: "359",
  ),

  fruitModel(
    name: EnumFruits.orange,
    image: "assets/fruits/orange.png",
    price: "5.99",
    rating: "3.0",
    ratingPrice: "179",
  ),
  fruitModel(
    name: EnumFruits.pepper,
    image: "assets/fruits/pepper.png",
    price: "2.99",
    rating: "4.0",
    ratingPrice: "109",
  ),
];

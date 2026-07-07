class CategoryModel {
  String name;
  String image;
  CategoryModel({required this.name, required this.image});
}

class fruitModel {
  EnumFruits name;

  String image;
  String price;
  String rating;
  String ratingPrice;

  fruitModel({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.ratingPrice,
  });
}

enum EnumFruits { banana, orange, pepper }

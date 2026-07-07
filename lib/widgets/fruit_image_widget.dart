import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/utils/color_app.dart';

class FruitImageWidget extends StatelessWidget {
  FruitImageWidget({
    super.key,
    required this.fruitImage,
    required this.height,
    required this.width,
    required this.backgroundColor,
    this.borderRadius = 0,
  });
  String fruitImage;
  double height;
  double width;
  Color backgroundColor;
  double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        // color: ColorApp.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(fruitImage),
      ),
    );
  }
}

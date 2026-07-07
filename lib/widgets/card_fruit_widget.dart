import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_delivery_app/model.dart';
import 'package:grocery_delivery_app/utils/color_app.dart';
import 'package:grocery_delivery_app/widgets/fruit_image_widget.dart';

class CardFruitWidget extends StatelessWidget {
  CardFruitWidget({
    super.key,
    required this.fruit,
    required this.onTapAdd,
    required this.onTapDelete,
    required this.countFruit,
  });
  fruitModel fruit;
  void Function()? onTapAdd;
  void Function()? onTapDelete;
  int countFruit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SizedBox(
        width: 170,
        height: 245,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                FruitImageWidget(
                  fruitImage: fruit.image,
                  height: 147,
                  width: 170,
                  backgroundColor: ColorApp.neutralsColor,
                  borderRadius: 10,
                ),
                countFruit > 0
                    ? Positioned(
                        bottom: 6,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          height: 38,
                          // width: 38,
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: onTapDelete,
                                child: FaIcon(
                                  FontAwesomeIcons.trashCan,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                countFruit.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: onTapAdd,
                                child: Icon(Icons.add, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: 6,
                        right: 8,
                        child: Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            onTap: onTapAdd,
                            child: Icon(Icons.add, color: Colors.black),
                          ),
                        ),
                      ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(child: Row(children: [])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        fruit.name.toString().split(".").last,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // SizedBox(width: 30),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: ColorApp.secondryColor,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            fruit.rating,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "\$${fruit.price}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "(${fruit.ratingPrice})",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

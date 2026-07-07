import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.category});
  CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,

            decoration: BoxDecoration(
              color: const Color(0x1F5E5656),
              // color: Colors.amber,
              // borderRadius: BorderRadius.circular(50),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(category.image, fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.center,
            child: Text(
              category.name,

              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

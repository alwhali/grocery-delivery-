import 'package:flutter/material.dart';

class BadgeOfNumber extends StatelessWidget {
  BadgeOfNumber({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

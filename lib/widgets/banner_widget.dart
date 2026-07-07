import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, required this.pathBanner});

  final String pathBanner;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 222.0,
      // margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(pathBanner), fit: BoxFit.fill),
      ),
    );
  }
}

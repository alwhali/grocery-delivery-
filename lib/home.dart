import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_delivery_app/data.dart';
import 'package:grocery_delivery_app/model.dart';
import 'package:grocery_delivery_app/utils/color_app.dart';
import 'package:grocery_delivery_app/widgets/badge_number.dart';
import 'package:grocery_delivery_app/widgets/banner_widget.dart';
import 'package:grocery_delivery_app/widgets/card_fruit_widget.dart';
import 'package:grocery_delivery_app/widgets/category_widget.dart';
import 'package:grocery_delivery_app/widgets/fruit_image_widget.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.95,
  );

  Map<EnumFruits, int> basket = {};

  void addFruitToFruitsMap(EnumFruits fruit) {
    if (!basket.containsKey(fruit)) {
      basket[fruit] = 0;
    }
    basket[fruit] = basket[fruit]! + 1;
  }

  void removeFruitToFruitsMap(EnumFruits fruit) {
    if (basket[fruit]! > 1) {
      basket[fruit] = basket[fruit]! - 1;

      // fruitsMap[fruit] = 0;
    } else {
      basket.remove(fruit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              // FaIcon(FontAwesomeIcons.motorcycle),
              SvgPicture.asset(
                "assets/icons/motocycle.svg",
                height: 14,
                width: 20,
              ),

              SizedBox(width: 10),
              SizedBox(
                width: 140,
                child: Text(
                  "61 Hopper streets in the city",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down, size: 30),
              Spacer(),
              SvgPicture.asset(
                "assets/icons/basket.svg",
                height: 24,
                width: 24,
              ),
              // FaIcon(FontAwesomeIcons.cartShopping, size: 22),
              // Icon(Icons.shopping_cart_outlined, size: 24),
            ],
          ),
        ),
        // actionsPadding: EdgeInsets.all(20),
        // actions: [
        //   FaIcon(FontAwesomeIcons.motorcycle),
        //   SizedBox(width: 10),
        //   SizedBox(
        //     width: 150,
        //     child: Text(
        //       "61 Hopper streets in the city",
        //       maxLines: 1,
        //       overflow: TextOverflow.ellipsis,
        //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        //     ),
        //   ),
        //   SizedBox(width: 5),
        //   Icon(Icons.arrow_drop_down, size: 30),
        //   Spacer(),
        //   FaIcon(FontAwesomeIcons.cartShopping, size: 22),
        // ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                children: [
                  //old banner

                  // SizedBox(
                  //   height: 200,
                  //   width: double.infinity,

                  //   child: PageView.builder(
                  //     controller: pageController,
                  //     itemCount: banners.length,
                  //     itemBuilder: (context, index) {
                  //       return BannerWidget(pathBanner: banners[index]);
                  //     },
                  //   ),
                  // ),

                  //new banner
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 222.0,

                      // aspectRatio: 1,
                      autoPlay: true,

                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.83,
                      enlargeCenterPage: true,
                    ),

                    //this is CarouselSlider without builder
                    // items: banners.map((banner) {
                    //   return Builder(
                    //     builder: (BuildContext context) {
                    //       return BannerWidget(pathBanner: banner);
                    //     },
                    //   );
                    // }).toList(),

                    // this is CarouselSlider with builder
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) {
                          // we use this with pageview instead of carouselslider
                          // return BannerWidget(pathBanner: banners[index]);
                          return Image.asset(banners[index]);
                        },
                    itemCount: banners.length,
                  ),
                  SizedBox(height: 20),

                  //category
                  BuildCategorys(categorys: categoryList),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fruits",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorApp.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  //fruits list
                  SizedBox(
                    height: 245,
                    width: double.infinity,
                    // this is by using listview.builder
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fruitList.length,
                      itemBuilder: (context, index) {
                        return CardFruitWidget(
                          fruit: fruitList[index],
                          onTapAdd: () {
                            setState(() {
                              addFruitToFruitsMap(fruitList[index].name);
                            });
                          },
                          onTapDelete: () {
                            setState(() {
                              removeFruitToFruitsMap(fruitList[index].name);
                            });
                          },
                          countFruit: basket[fruitList[index].name] ?? 0,
                        );
                      },
                    ),

                    //this is by using liss.generate
                    // child: SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: List.generate(fruitList.length, (index) {
                    //       return CardFruitWidget(fruit: fruitList[index]);
                    //     }),
                    //   ),
                    // ),
                  ),
                  SizedBox(height: 140),
                ],
              ),
            ),
          ),

          //basket
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 70,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: ColorApp.primaryColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.rtl,

                  children: [
                    //BAsket
                    SizedBox(
                      height: 35,
                      width: 35,

                      child: Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              // height: 20,
                              // width: 20,
                              child: SvgPicture.asset(
                                "assets/icons/basket.svg",
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          basket.length > 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,

                                  child: BadgeOfNumber(number: basket.length),
                                )
                              : Container(),
                        ],
                      ),
                    ),

                    Text(
                      "View Basket",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(width: 10),
                    // Text(
                    //   " | ",
                    //   style: TextStyle(
                    //     fontSize: 28,
                    //     fontWeight: FontWeight.w900,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    Container(height: 30, width: 2, color: Colors.white),

                    SizedBox(width: 5),

                    // Row(
                    //   children: List.generate(fruitsInTheBasket.length, (
                    //     index,
                    //   ) {
                    //     // there is enumfruits and FruitsList and fruitsmap called fruitsInTheBasket
                    //     //in enumFruit there is name and index for each fruit
                    //     //in fruitList the index is the same as the enumFruits
                    //     //int the fruitsInTheBasket what fruits these user choose

                    //     //what is important:
                    //     //by useing key (type of enumFruits) in fruitsInTheBasket
                    //     // wee can have the information about this fruit in fruitList
                    //     EnumFruits keyCurrentFruitInBasket = fruitsInTheBasket
                    //         .entries
                    //         .elementAt(index)
                    //         .key;
                    //     int ValueCurrentFruitInBasket = fruitsInTheBasket
                    //         .entries
                    //         .elementAt(index)
                    //         .value;
                    //     int indexCurrentFruitInEnuFruit =
                    //         keyCurrentFruitInBasket.index;
                    //     return FruitInToBasket(
                    //       fruit: fruitList[indexCurrentFruitInEnuFruit],
                    //       fruitValue: ValueCurrentFruitInBasket,
                    //     );
                    //   }),
                    // ),
                    SizedBox(
                      width: 190,
                      height: 40,
                      child: ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        // itemCount: fruitsInTheBasket.length,
                        itemCount: basket.length,
                        itemBuilder: (context, index) {
                          EnumFruits keyCurrentFruitInBasket = basket.entries
                              .elementAt(index)
                              .key;
                          int valueCurrentFruitInBasket = basket.entries
                              .elementAt(index)
                              .value;
                          int indexCurrentFruitInEnuFruit =
                              keyCurrentFruitInBasket.index;
                          return FruitInToBasket(
                            fruit: fruitList[indexCurrentFruitInEnuFruit],
                            fruitValue: valueCurrentFruitInBasket,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //bottom nav bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: ColorApp.primaryColor),
                    bottom: BorderSide(color: ColorApp.primaryColor),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      TapBottomNavBar(
                        icon: FontAwesomeIcons.home,
                        text: "Home",
                        onTap: () {},
                      ),
                      TapBottomNavBar(
                        icon: FontAwesomeIcons.heart,
                        text: "Favourtes",
                        onTap: () {},
                      ),
                      TapBottomNavBar(
                        icon: FontAwesomeIcons.magnifyingGlass,
                        text: "Search",
                        onTap: () {},
                      ),
                      TapBottomNavBar(
                        icon: FontAwesomeIcons.user,
                        text: "Profile",
                        onTap: () {},
                      ),
                      TapBottomNavBar(
                        icon: FontAwesomeIcons.bars,
                        text: "Menu",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FruitInToBasket extends StatelessWidget {
  FruitInToBasket({super.key, required this.fruit, required this.fruitValue});
  fruitModel fruit;
  int fruitValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      height: 40,
      width: 40,

      child: Stack(
        alignment: Alignment.center,
        children: [
          FruitImageWidget(
            fruitImage: fruit.image,
            height: 36,
            width: 36,
            backgroundColor: Colors.white,
            borderRadius: 50,
          ),
          fruitValue > 1
              ? Positioned(
                  top: 0,
                  right: 0,

                  child: BadgeOfNumber(number: fruitValue),
                )
              : Container(),
        ],
      ),
    );
  }
}

class TapBottomNavBar extends StatelessWidget {
  TapBottomNavBar({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  FaIconData icon;
  String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(Icons.home, size: 22),
          FaIcon(icon, size: 24),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class BuildCategorys extends StatelessWidget {
  BuildCategorys({super.key, required this.categorys});
  List<CategoryModel> categorys;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorys.length,
        itemBuilder: (context, index) {
          return CategoryWidget(category: categorys[index]);
        },
      ),
    );
  }
}

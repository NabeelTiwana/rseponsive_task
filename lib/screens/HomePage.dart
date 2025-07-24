import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_task/constent/images.dart';
import 'package:responsive_task/responsive/responsive_helper.dart';
import 'package:responsive_task/responsive/responsive_text_style.dart';
import 'package:responsive_task/responsive/responsive_widget.dart';

import '../shape/custom_shape.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xffefefe5),
          child: SingleChildScrollView(
            child: Padding(
              padding: context.allPadding,
              child: Column(
                children: [
                  const MyAppbar(),
                  SizedBox(height: context.smallSpacing),
                  const MyBanner(),
                  SizedBox(height: context.smallSpacing),
                  Center(
                    child: SizedBox(
                      width: ResponsiveHelper.getValue(
                        context,
                        mobile: 300,
                        tablet: 400,
                        desktop: 500,
                      ),
                      height: 50,
                      child: ListView.builder(
                        itemCount: MyImage.allLogos.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          bool isSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.symmetric(
                                  horizontal: context.smallSpacing / 2),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.deepPurple
                                    : Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  MyImage.allLogos[index],
                                  fit: BoxFit.contain,
                                  colorFilter: ColorFilter.mode(
                                    isSelected ? Colors.white : Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: context.mediumSpacing),
                  Padding(
                    padding: context.horizontalPadding,
                    child: Row(
                      children: [
                        Text(
                          'Popular Shoes',
                          style: context.responsiveTitleLarge.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: context.responsiveBodyMedium.copyWith(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.smallSpacing),
                  SizedBox(
                    width: double.infinity,
                    height: ResponsiveHelper.getValue(
                      context,
                      mobile: 225,
                      tablet: 250,
                      desktop: 300,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      padding: context.horizontalPadding,
                      itemBuilder: (context, index) {
                        return Container(
                          width: ResponsiveHelper.getValue(
                            context,
                            mobile: 150,
                            tablet: 180,
                            desktop: 200,
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: context.smallSpacing),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/images/products/product.png',
                                    width: ResponsiveHelper.getValue(
                                      context,
                                      mobile: 120,
                                      tablet: 140,
                                      desktop: 160,
                                    ),
                                  ),
                                ),
                                Text(
                                  'BEST SELLER',
                                  style: context.responsiveBodySmall.copyWith(
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                SizedBox(height: context.smallSpacing / 2),
                                Text(
                                  'Nike Jordan',
                                  style: context.responsiveBodyLarge.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      '\$493.00',
                                      style: context.responsiveBodyLarge.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 40,
                                      height: 49,
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _BannerContent(scaleFactor: 1.0),
      tablet: _BannerContent(scaleFactor: 1.2),
      desktop: _BannerContent(scaleFactor: 1.5),
    );
  }
}

class _BannerContent extends StatelessWidget {
  final double scaleFactor;

  const _BannerContent({required this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200 * scaleFactor,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        ClipPath(
          clipper: CustomStraightClipper(),
          child: Container(
            width: double.infinity,
            height: 200 * scaleFactor,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20 * scaleFactor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '50% ',
                  style: context.responsiveHeadlineLarge.copyWith(
                    color: Colors.deepOrange,
                  ),
                  children: [
                    TextSpan(
                      text: 'Discount',
                      style: context.responsiveHeadlineMedium.copyWith(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'End of Season',
                style: context.responsiveTitleLarge.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5 * scaleFactor),
              Text(
                'More Style added Sale\nending soon',
                style: context.responsiveBodyMedium.copyWith(
                  color: Colors.black38,
                ),
              ),
              SizedBox(height: 5 * scaleFactor),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black),
                child: Text(
                  'Shop now',
                  style: context.responsiveBodyMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -12 * scaleFactor,
          bottom: 0,
          child: Image.asset(
            'assets/images/banner/product.png',
            width: 200 * scaleFactor,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Icon(Icons.search, color: Colors.grey, size: 24),
          ),
          Text(
            'BRANDSDEKHO.AI',
            style: context.responsiveTitleLarge.copyWith(
              color: Colors.black,
            ),
          ),
          Icon(Icons.notifications_none, color: Colors.indigo, size: 24),
        ],
      ),
    );
  }
}
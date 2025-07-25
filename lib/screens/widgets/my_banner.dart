import 'package:flutter/material.dart';
import 'package:responsive_task/responsive/responsive_text_style.dart';

import '../../responsive/responsive_widget.dart';
import '../../shape/custom_shape.dart';

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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
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

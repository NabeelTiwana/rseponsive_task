import 'package:flutter/material.dart';
import 'package:responsive_task/responsive/responsive_text_style.dart';

import '../../responsive/responsive_helper.dart';

class MyProductContainer extends StatefulWidget {
  const MyProductContainer({super.key});

  @override
  State<MyProductContainer> createState() => _MyProductContainerState();
}

class _MyProductContainerState extends State<MyProductContainer> {
  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/products/Nike.png',
      'title': 'BEST SELLER',
      'subtitle': 'Nike Jordan',
      'price': '\$493.00',
    },
    {
      'image': 'assets/images/products/adidas.png',
      'title': 'BEST SELLER',
      'subtitle': 'Adidas',
      'price': '\$500.00',
    },
    {
      'image': 'assets/images/products/puma.png',
      'title': 'BEST SELLER',
      'subtitle': 'Puma',
      'price': '\$400.00',
    },
    {
      'image': 'assets/images/products/reebok.png',
      'title': 'BEST SELLER',
      'subtitle': 'Reebok',
      'price': '\$380.00',
    },
    {
      'image': 'assets/images/products/Under-Armour.png',
      'title': 'BEST SELLER',
      'subtitle': 'Under Armour',
      'price': '\$300.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ResponsiveHelper.getValue(
        context,
        mobile: 225,
        tablet: 250,
        desktop: 300,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        padding: context.horizontalPadding,
        itemBuilder: (context, index) {
          final item=items[index];
          return Container(
            width: ResponsiveHelper.getValue(
              context,
              mobile: 150,
              tablet: 180,
              desktop: 200,
            ),
            margin: EdgeInsets.symmetric(horizontal: context.smallSpacing),
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
                      item['image']!,
                      width: ResponsiveHelper.getValue(
                        context,
                        mobile: 120,
                        tablet: 140,
                        desktop: 160,
                      ),
                    ),
                  ),
                  Text(
                    item['title'],
                    style: context.responsiveBodySmall.copyWith(
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: context.smallSpacing / 2),
                  Text(
                    item['subtitle'],
                    style: context.responsiveBodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        item['price'],
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
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
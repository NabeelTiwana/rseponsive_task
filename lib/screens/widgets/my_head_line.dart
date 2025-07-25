import 'package:flutter/material.dart';
import 'package:responsive_task/responsive/responsive_text_style.dart';

class MyHeadings extends StatelessWidget {
  const MyHeadings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPadding,
      child: Row(
        children: [
          Text(
            'Popular Shoes',
            style: context.responsiveTitleLarge.copyWith(color: Colors.black),
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
    );
  }
}
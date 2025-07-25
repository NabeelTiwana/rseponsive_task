import 'package:flutter/material.dart';
import 'package:responsive_task/responsive/responsive_text_style.dart';

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
            style: context.responsiveTitleLarge.copyWith(color: Colors.black),
          ),
          Icon(Icons.notifications_none, color: Colors.indigo, size: 24),
        ],
      ),
    );
  }
}

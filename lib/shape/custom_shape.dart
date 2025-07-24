import 'package:flutter/material.dart';

class CustomStraightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    // Starting point (top-left)
    path.moveTo(0, 0);

    // Top edge to top-right (70% width se thoda peeche)
    path.lineTo(width * 0.8, 0);

    // Straight line to bottom-right (70% height)
    path.lineTo(width, height * 0.9);

    // Bottom-right to bottom-left
    path.lineTo(width, height);
    path.lineTo(0, height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
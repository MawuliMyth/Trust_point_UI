import 'package:flutter/material.dart';

// Custom Clipper for Slanted Design (Adjusted Slant)
class SlantedContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.3); // Start from left (lower point)
    path.lineTo(size.width, size.height * 0.1); // Lowered top-right slant
    path.lineTo(size.width, size.height); // Move to bottom right
    path.lineTo(0, size.height); // Move to bottom left
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

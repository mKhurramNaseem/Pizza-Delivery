import 'package:flutter/material.dart';

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Size(:width, :height) = size;
    return Path()
      ..moveTo(width / 3, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(width / 3, height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

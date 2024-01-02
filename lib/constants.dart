import 'package:flutter/material.dart';

class Options {
  final String text;
  final String img;
  final int code;
  final Color color;
  Options(this.text, this.img, this.code, this.color);
}

Color introBg = Colors.black;
double widthSocial = 50;

final options = [
  Options("Languages", "assets/insan.png", 1, Colors.green),
  Options("Projects", "assets/insan.png", 2, Colors.blue),
  Options("Experience", "assets/insan.png", 3, Colors.yellow),
  Options("Other Skills", "assets/insan.png", 4, Colors.blueGrey),
  Options("About", "assets/insan.png", 6, Colors.red),
];

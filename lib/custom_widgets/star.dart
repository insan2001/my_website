import 'package:flutter/material.dart';
import 'package:my/custom_widgets/star_clipper.dart';

class MyStar extends StatelessWidget {
  final double size;
  final Color color;
  const MyStar({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: StarClipper(5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        width: size,
        height: size,
        color: color,
      ),
    );
  }
}

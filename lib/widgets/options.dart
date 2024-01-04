import 'package:flutter/material.dart';
import 'package:my/details.dart';
import 'package:my/game/drag.dart';
import 'package:my/game/game_space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: MediaQuery.of(context).size.width <= 640
          ? null
          : const NeverScrollableScrollPhysics(),
      crossAxisCount: isMobile ? 2 : 3,
      children: List.generate(
        homeWidget.length,
        (index) => MyDraggable(
          homeWidget: homeWidget[index],
        ),
      ),
    );
  }
}

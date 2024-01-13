import 'package:flutter/material.dart';
import 'package:my/details.dart';
import 'package:my/game/drag.dart';
import 'package:my/game/game_space.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool absorb = false;

  toggleAbsorb() {
    setState(() {
      absorb = !absorb;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorb,
      child: GridView.count(
        physics: isMobile || MediaQuery.of(context).size.width <= 640
            ? null
            : const NeverScrollableScrollPhysics(),
        crossAxisCount: isMobile ? 2 : 3,
        children: List.generate(
          homeWidget.length,
          (index) => MyDraggable(
            homeWidget: homeWidget[index],
          ),
        ),
      ),
    );
  }
}

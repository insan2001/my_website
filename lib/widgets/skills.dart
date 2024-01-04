import 'package:flutter/material.dart';
import 'package:my/details.dart';
import 'package:my/game/game_space.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        mySkills.length,
        (index) => ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(tableWidth / 6),
            child: Image.asset(mySkills[index], fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

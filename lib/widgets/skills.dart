import 'package:flutter/material.dart';
import 'package:my/details.dart';
import 'package:my/game/game_space.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width <= 640
          ? 2
          : (mySkills.length / 2).ceil(),
      children: List.generate(
        mySkills.length,
        (index) => Container(
          margin: EdgeInsets.all(tableHeight / 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(mySkills[index], fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

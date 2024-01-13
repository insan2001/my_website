import 'package:flutter/material.dart';
import 'package:my/details.dart';
import 'package:my/game/game_space.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: isMobile || MediaQuery.of(context).size.width <= 640
          ? 2
          : (mySkills.length / 2).ceil(),
      children: List.generate(
        mySkills.length,
        (index) => Container(
          margin: EdgeInsets.all(tableWidth / 20),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Container(
              color: Colors.black,
              child: Image.asset(
                mySkills[index],
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

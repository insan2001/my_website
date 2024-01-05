import 'package:flutter/material.dart';
import 'package:my/game/game_space.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "I'm a student. Currently i'm learing flutter and i have 5 year experience with flutter. I'm not good at designing but i'm very well with development.",
              style: TextStyle(
                  fontSize:
                      isMobile ? 20 : MediaQuery.of(context).size.width / 40,
                  color: const Color.fromARGB(255, 12, 26, 228)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            height: isMobile
                ? MediaQuery.of(context).size.height / 10
                : tableHeight / 5,
            width: isMobile
                ? MediaQuery.of(context).size.width / 2
                : tableWidth / 2,
            child: Row(
              children: [
                const Spacer(),
                Icon(
                  Icons.email,
                  color: const Color.fromARGB(255, 17, 248, 25),
                  size: tableWidth / 20,
                ),
                const Spacer(),
                Text(
                  "insan20011227@gmail.com",
                  style: TextStyle(fontSize: tableWidth / 30),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
              "I started my programing journey with cyber security. I have 1 year experience in cyber security. I felt bored with it and moved on to progrmming. Currently i'm a part time student who learing flutter and i have 5 year experience with python. To be frank i'm a bad designer but a good developer.",
              style: TextStyle(
                fontSize:
                    isMobile ? 20 : MediaQuery.of(context).size.width / 40,
              ),
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
                  color: Colors.black,
                  size: tableWidth / 20,
                ),
                const Spacer(),
                SelectableText(
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

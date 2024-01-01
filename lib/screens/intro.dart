import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my/constants.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "Hi, I'm Insan",
              speed: const Duration(milliseconds: 150),
            ),
          ],
          isRepeatingAnimation: false,
        ),
        centerTitle: true,
        backgroundColor: intro_bg,
      ),
      backgroundColor: intro_bg,
      body: Row(
        children: [
          const SizedBox(
            width: 50,
            child: RotatedBox(
              quarterTurns: 3,
              child: Row(
                children: [
                  Spacer(),
                  Text("LinkedIn"),
                  Spacer(),
                  Text("Github"),
                  Spacer(),
                  Text("Leetcode"),
                  Spacer(),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.amber,
            width: MediaQuery.of(context).size.width - 50,
          ),
        ],
      ),
    );
  }
}

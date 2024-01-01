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
          SizedBox(
            width: 50,
            child: RotatedBox(
              quarterTurns: 3,
              child: Row(
                children: [
                  const Spacer(),
                  Image.network("https://raw.githubusercontent.com/insan2001/my_website/main/assets/LinkedIn-Blue-26%402x.png"),
                  Spacer(),
                  Text("Github"),
                  const Spacer(),
                  Text("Leetcode"),
                  const Spacer(),
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

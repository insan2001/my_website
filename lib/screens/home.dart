import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/custom_widgets/social_media.dart';
import 'package:my/game/game_space.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
            foregroundImage: Image.asset(
          "assets/insan.png",
          filterQuality: FilterQuality.high,
        ).image),
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "Hi, I'm Insan",
              textStyle: const TextStyle(color: Colors.white),
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
                  SocialMediaButton(
                      imageLocation: "assets/LinkedIn.png",
                      imageUrl:
                          "https://www.linkedin.com/in/insan-j-885422299/"),
                  Spacer(),
                  SocialMediaButton(
                      imageLocation: "assets/GitHub.png",
                      imageUrl: "https://github.com/insan2001"),
                  Spacer(),
                ],
              ),
            ),
          ),
          GameSpace(),
        ],
      ),
    );
  }
}

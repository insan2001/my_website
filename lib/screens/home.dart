import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/custom_widgets/social_media.dart';
import 'package:my/game/game_space.dart';
import 'package:my/screens/languages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> screens = [
    GameSpace(),
    LanguageScreen(),
    LanguageScreen(),
    LanguageScreen(),
    LanguageScreen(),
    LanguageScreen(),
    LanguageScreen(),
  ];

  indexChanger(int updatedIndex) {
    setState(() {
      index = updatedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          foregroundImage: Image.asset(
            "assets/insan.png",
            filterQuality: FilterQuality.high,
          ).image,
        ),
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
        backgroundColor: introBg,
      ),
      backgroundColor: introBg,
      body: SizedBox(
        child: Row(
          children: [
            SizedBox(
              width: widthSocial,
              child: const RotatedBox(
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
            screens[index],
          ],
        ),
      ),
    );
  }
}

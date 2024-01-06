import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/custom_widgets/social_media.dart';
import 'package:my/game/game_space.dart';

late Function indexChanger;

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  bool absorb = false;

  mySetter(int newIndex) {
    setState(() {
      index = newIndex;
      absorb = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    indexChanger = mySetter;
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          foregroundImage: Image.asset(
            "assets/home/insan.png",
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
        actions: [
          index != 0
              ? AbsorbPointer(
                  absorbing: absorb,
                  child: IconButton(
                      onPressed: () async {
                        setState(() {
                          absorb = true;
                        });
                        await changer(isMobile ? screenHeight : screenWidth, 0);
                        dropKey.currentState?.child = Container();
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: exitColor,
                        size: 40,
                      )),
                )
              : Container(),
        ],
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
                        imageLocation: "assets/home/LinkedIn.png",
                        imageUrl:
                            "https://www.linkedin.com/in/insan-j-885422299/"),
                    Spacer(),
                    SocialMediaButton(
                        imageLocation: "assets/home/GitHub.png",
                        imageUrl: "https://github.com/insan2001"),
                    Spacer(),
                  ],
                ),
              ),
            ),
            const GameSpace(),
          ],
        ),
      ),
    );
  }
}

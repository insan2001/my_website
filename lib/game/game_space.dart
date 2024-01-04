import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/game/animated_fold.dart';
import 'package:my/game/drop.dart';
import 'package:my/widgets/about.dart';
import 'package:my/widgets/experience.dart';
import 'package:my/widgets/languages.dart';
import 'package:my/widgets/options.dart';
import 'package:my/widgets/projects.dart';
import 'package:my/widgets/skills.dart';

late double screenWidth;
late double screenHeight;
late double tableWidth;
late double tableHeight;
late double topPosition;
late double doorWidth;
late double dropZone;
late bool isMobile;
late Function changer;
late int index;

class GameSpace extends StatefulWidget {
  const GameSpace({super.key});
  @override
  State<GameSpace> createState() => _GameSpaceState();
}

class _GameSpaceState extends State<GameSpace> {
  double hiddenSize = 0;

  bool dragged = false;

  final myKey = GlobalKey<AnimatedFoldState>();
  final List<Widget> screens = const [
    HomeScreen(),
    Languages(),
    Projects(),
    Experience(),
    Skills(),
    About(),
  ];

  change(double size, int index) async {
    myKey.currentState?.toggleFold();
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      hiddenSize = size;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    indexChanger(index);
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      hiddenSize = 0;
    });
  }

  indexChanger(int updatedIndex) {
    setState(() {
      index = updatedIndex;
    });
  }

  @override
  void initState() {
    changer = change;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    isMobile = screenWidth <= 640;

    tableWidth = isMobile ? screenWidth - widthSocial : screenWidth / 2;
    tableHeight = isMobile ? screenHeight : screenWidth / 3;
    topPosition = isMobile ? 0 : (screenHeight - tableHeight) / 2;
    doorWidth = tableWidth * 2 / 5;
    dropZone = doorWidth / 9;

    return Container(
      color: homeBg,
      width: screenWidth - widthSocial,
      child: Stack(
        children: [
          // draggable
          Positioned(
            top: topPosition,
            left: isMobile ? 0 : widthSocial,
            child: SizedBox(
              width: tableWidth,
              height: isMobile ? tableHeight * 0.9 : tableHeight,
              child: screens[index],
            ),
          ),
          // door
          isMobile
              ? Container()
              : Positioned(
                  top: topPosition,
                  right: widthSocial,
                  child: Container(
                    color: doorFrame,
                    width: doorWidth,
                    height: tableHeight,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(tableWidth / 100),
                          child: Container(
                            color: doorBg,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(doorWidth / 50),
                          child: AnimatedFold(
                            key: myKey,
                            frontWidget: Stack(
                              children: [
                                Image.asset("assets/home/door.png"),
                                Positioned(
                                  left: doorWidth * 0.8,
                                  top: tableHeight * 0.43,
                                  child: DropZone(
                                    controller: myKey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),

          Positioned(
            top: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: hiddenSize,
              height: hiddenSize,
              color: screenHider,
            ),
          ),
        ],
      ),
    );
  }
}

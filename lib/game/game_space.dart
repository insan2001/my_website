import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/details.dart';
import 'package:my/game/animated_fold.dart';
import 'package:my/game/drop.dart';
import 'package:my/screens/home.dart';
import 'package:my/widgets/my_home.dart';

late double screenWidth;
late double screenHeight;
late double tableWidth;
late double tableHeight;
late double topPosition;
late double doorWidth;
late double dropZone;
late bool isMobile;
late Function(double size, int index) changer;
late int index;
final dragKey = GlobalKey<HomeScreenState>();
final dropKey = GlobalKey<DropZoneState>();

class GameSpace extends StatefulWidget {
  const GameSpace({super.key});
  @override
  State<GameSpace> createState() => _GameSpaceState();
}

class _GameSpaceState extends State<GameSpace> {
  double hiddenSize = 0;
  bool dragged = false;
  final myKey = GlobalKey<AnimatedFoldState>();

  change(double size, int index) async {
    dragKey.currentState?.toggleAbsorb();
    isMobile ? null : myKey.currentState?.toggleFold();
    isMobile ? null : await Future.delayed(const Duration(milliseconds: 1000));
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

  @override
  void initState() {
    changer = change;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    isMobile = defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    isMobile = defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        MediaQuery.of(context).size.width <= 640;

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
                                  child: DropZone(key: dropKey),
                                ),
                                Positioned(
                                  top: tableHeight * 0.47,
                                  left: doorWidth * 0.26,
                                  child: SizedBox(
                                    width: doorWidth * 0.5,
                                    child: Text(
                                      "Drag to the circle to open the door",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              60,
                                          color: Colors.white),
                                    ),
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

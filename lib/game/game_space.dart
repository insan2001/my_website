import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/game/animated_fold.dart';
import 'package:my/game/drag.dart';
import 'package:my/game/drop.dart';
import 'package:my/main.dart';

class GameSpace extends StatefulWidget {
  const GameSpace({super.key});
  @override
  State<GameSpace> createState() => _GameSpaceState();
}

class _GameSpaceState extends State<GameSpace> {
  bool dragged = false;
  int value = 0;
  final myKey = GlobalKey<AnimatedFoldState>();
  double hiddenSize = 0;
  Color dropZoneColor = Colors.black;
  Color hiddenColor = Colors.transparent;

  change(double size, Options options) async {
    myKey.currentState?.toggleFold();
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      dropZoneColor = options.color;
      hiddenSize = size;
      hiddenColor = options.color;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      hiddenSize = 0;
    });
    homeKey.currentState?.indexChanger(options.code);
  }

  @override
  Widget build(BuildContext context) {
    final tableWidth = MediaQuery.of(context).size.width / 2;
    final tableHeight = tableWidth * 2 / 3;
    final doorWidth = (tableWidth / 2) - (tableWidth / 10);
    final topPosition = (MediaQuery.of(context).size.height - tableHeight) / 2;
    final dropZone = doorWidth / 4;

    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width - 50,
      child: Stack(
        children: [
          // draggable
          Positioned(
            top: topPosition,
            left: widthSocial,
            child: SizedBox(
              width: tableWidth,
              height: tableHeight,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: List.generate(
                  options.length,
                  (index) => MyDraggable(
                    option: options[index],
                    height: tableHeight / 2,
                    dragSize: dropZone,
                  ),
                ),
              ),
            ),
          ),
          // door
          Positioned(
            top: topPosition,
            right: widthSocial,
            child: Container(
              color: Colors.brown,
              width: doorWidth,
              height: tableHeight,
              child: Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(tableWidth / 100),
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(doorWidth / 50),
                    child: AnimatedFold(
                      key: myKey,
                      frontWidget: Image.asset("assets/wooden_door.png"),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          // drag spot
          Positioned(
            top: topPosition - dropZone,
            right: (widthSocial + doorWidth / 2) - dropZone / 2,
            child: DropZone(
              size: dropZone,
              color: dropZoneColor,
              controller: myKey,
              change: change,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: hiddenSize,
              height: hiddenSize,
              color: hiddenColor,
            ),
          ),
        ],
      ),
    );
  }
}

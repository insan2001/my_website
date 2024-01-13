import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/game/game_space.dart';

class DropZone extends StatefulWidget {
  const DropZone({
    super.key,
  });

  @override
  State<DropZone> createState() => DropZoneState();
}

class DropZoneState extends State<DropZone> {
  late Color dzColor;
  late Widget child;

  @override
  void initState() {
    child = Container();
    dzColor = dropZoneColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<Map<String, dynamic>>(
      builder: (context, candidateData, rejectedData) => AnimatedContainer(
        decoration: BoxDecoration(
          color: dzColor,
          border: Border.all(color: dropBorder),
          shape: BoxShape.circle,
        ),
        duration: const Duration(milliseconds: 200),
        height: dropZone,
        width: dropZone,
        child: Center(
          child: child,
        ),
      ),
      onMove: (details) => setState(() {
        dzColor = dropZoneIndicator;
      }),
      onLeave: (data) => setState(() {
        dzColor = dropZoneColor;
      }),
      onAccept: (Map<String, dynamic> option) async {
        setState(() {
          dzColor = dropZoneColor;
          child = ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              option["image"],
              width: dropZone,
              height: dropZone,
            ),
          );
        });
        changer(screenWidth, option["index"]);
      },
    );
  }
}

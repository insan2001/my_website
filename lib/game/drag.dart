import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/custom_widgets/table.dart';
import 'package:my/game/game_space.dart';

class MyDraggable extends StatefulWidget {
  final Map<String, dynamic> homeWidget;
  const MyDraggable({
    super.key,
    required this.homeWidget,
  });

  @override
  State<MyDraggable> createState() => _MyDraggableState();
}

class _MyDraggableState extends State<MyDraggable> {
  late final Offset feedbackOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(tableHeight / 100),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: tableBg,
          border: Border.all(
            width: 2,
          )),
      child: isMobile
          ? GestureDetector(
              onTap: () {
                changer(screenHeight, widget.homeWidget["index"]);
              },
              child: HomeTable(homeWidget: widget.homeWidget))
          : Draggable<Map<String, dynamic>>(
              data: widget.homeWidget,
              dragAnchorStrategy: (draggable, context, position) =>
                  Offset(dropZone / 2, dropZone / 2),
              feedback: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  widget.homeWidget["image"],
                  width: dropZone,
                  height: dropZone,
                ),
              ),
              childWhenDragging: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  widget.homeWidget["imageHolder"],
                  width: isMobile ? tableWidth / 2 : tableWidth / 4,
                  height: isMobile ? tableHeight / 2 : tableHeight / 4,
                ),
              ),
              child: HomeTable(homeWidget: widget.homeWidget),
            ),
    );
  }
}

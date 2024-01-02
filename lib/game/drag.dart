import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/custom_widgets/star.dart';

class MyDraggable extends StatefulWidget {
  final Options option;
  final double height;
  final double dragSize;
  const MyDraggable({
    super.key,
    required this.option,
    required this.height,
    required this.dragSize,
  });

  @override
  State<MyDraggable> createState() => _MyDraggableState();
}

class _MyDraggableState extends State<MyDraggable> {
  Offset feedbackOffset = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Draggable<Options>(
        data: widget.option,
        feedbackOffset: feedbackOffset,
        feedback: MyStar(size: widget.dragSize, color: widget.option.color),
        child: Stack(
          children: [
            Center(
              child: Container(
                color: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.all(widget.height / 8),
                  child: Image.asset(
                    widget.option.img,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                widget.option.text,
                style: TextStyle(fontSize: widget.height / 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}

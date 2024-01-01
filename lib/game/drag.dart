import 'package:flutter/material.dart';

class MyDraggable extends StatefulWidget {
  const MyDraggable({super.key});

  @override
  State<MyDraggable> createState() => _MyDraggableState();
}

class _MyDraggableState extends State<MyDraggable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Draggable(
        child: Text("data"),
        feedback: Text("feedback"),
      ),
    );
  }
}

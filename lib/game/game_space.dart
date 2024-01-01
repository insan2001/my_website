import 'package:flutter/material.dart';

class GameSpace extends StatefulWidget {
  const GameSpace({super.key});

  @override
  State<GameSpace> createState() => _GameSpaceState();
}

class _GameSpaceState extends State<GameSpace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width - 50,
      child: Stack(
        children: [
          // draggable
          
          // drag spot
        ],
      ),
    );
  }
}

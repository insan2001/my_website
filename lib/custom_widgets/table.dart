import 'package:flutter/material.dart';
import 'package:my/details.dart';
import 'package:my/game/game_space.dart';

class HomeTable extends StatefulWidget {
  final HomeWidget homeWidget;
  const HomeTable({super.key, required this.homeWidget});

  @override
  State<HomeTable> createState() => _HomeTableState();
}

class _HomeTableState extends State<HomeTable> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              widget.homeWidget.img,
              width: isMobile ? tableWidth / 2 : tableWidth / 4,
              height: isMobile ? tableHeight / 2 : tableHeight / 4,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            widget.homeWidget.text,
            style: TextStyle(
                fontSize: isMobile
                    ? MediaQuery.of(context).size.width / 20
                    : MediaQuery.of(context).size.width / 50,
                color: Colors.black),
          ),
        )
      ],
    );
  }
}

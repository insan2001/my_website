import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/custom_widgets/star.dart';
import 'package:my/game/animated_fold.dart';

class DropZone extends StatefulWidget {
  final double size;
  final Color color;
  final GlobalKey<AnimatedFoldState> controller;
  final Function change;
  const DropZone({
    super.key,
    required this.size,
    required this.color,
    required this.controller,
    required this.change,
  });

  @override
  State<DropZone> createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  late Color dropZoneColor;
  late double dropZondeSize;

  @override
  void initState() {
    dropZoneColor = widget.color;
    dropZondeSize = widget.size;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    dropZoneColor = widget.color;
    dropZondeSize = widget.size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<Options>(
      builder: (context, candidateData, rejectedData) => MyStar(
        size: dropZondeSize,
        color: dropZoneColor,
      ),
      onMove: (details) => setState(() {
        dropZoneColor = Colors.transparent;
      }),
      onLeave: (data) => setState(() {
        dropZoneColor = Colors.black;
      }),
      onAccept: (Options option) async {
        setState(() {
          dropZoneColor = option.color;
        });
        await Future.delayed(const Duration(milliseconds: 1000));
        widget.change(MediaQuery.of(context).size.width, option);
      },
    );
  }
}

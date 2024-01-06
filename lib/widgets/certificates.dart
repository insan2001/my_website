import 'package:flutter/material.dart';
import 'package:my/details.dart';
import 'package:my/game/game_space.dart';

class MyCertificates extends StatelessWidget {
  const MyCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: myCertificates.length,
        itemBuilder: (context, index) => Image.asset(
          myCertificates[index],
          height: tableHeight,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my/details.dart';
import 'package:photo_view/photo_view.dart';

class MyCertificates extends StatelessWidget {
  const MyCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      // mainAxisSpacing: 10,
      children: List.generate(
        myCertificates.length,
        (index) => PhotoView(
          imageProvider: AssetImage(myCertificates[index]),
        ),
      ),
    );
  }
}

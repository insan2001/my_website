import 'package:flutter/material.dart';
import 'package:my/function/lauch_url.dart';

class SocialMediaButton extends StatelessWidget {
  final String imageLocation;
  final String imageUrl;
  const SocialMediaButton(
      {super.key, required this.imageLocation, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchMyUrl(imageUrl);
        },
        child: Image.asset(
          imageLocation,
          height: 30,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

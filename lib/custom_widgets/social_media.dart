import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaButton extends StatelessWidget {
  final String imageLocation;
  final String imageUrl;
  const SocialMediaButton(
      {super.key, required this.imageLocation, required this.imageUrl});

  _launchUrl() async {
    final Uri url = Uri.parse(imageUrl);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      print("can't launch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchUrl,
        child: Image.asset(
          imageLocation,
          height: 30,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

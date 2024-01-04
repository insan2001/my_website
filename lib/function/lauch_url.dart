import 'package:url_launcher/url_launcher.dart';

launchMyUrl(String link) async {
  final Uri url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    launchUrl(url);
  }
}

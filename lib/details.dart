import 'package:my/constants.dart';

class HomeWidget {
  final String text;
  final String img;
  final String imgPick;
  final int index;
  HomeWidget(this.text, this.img, this.imgPick, this.index);
}

class Language {
  final String img;
  final String year;
  final bool verified;
  Language(this.img, this.year, {this.verified = false});
}

// add Icon
class Project {
  final String name;
  final String langImg;
  final String link;
  final String logo;
  final String description;
  Project(this.name, this.langImg, this.link, this.description, this.logo);
}

final homeWidget = [
  HomeWidget("Language", langs, "assets/home/programming_pick.png", 1),
  HomeWidget("Projects", projects, projectsHold, 2),
  HomeWidget("Experience", exp, expHold, 3),
  HomeWidget("Other Skills", skill, skillHold, 4),
  HomeWidget("Certificates", certificates, certificatesHold, 5),
  HomeWidget("About", about, aboutHold, 6),
];

final myLanguages = [
  Language(html, "2017"),
  Language(python, "2019", verified: true),
  Language(javaScript, "2021"),
  Language(dart, "2022", verified: true),
  Language(flutter, "2022", verified: true),
];

final myProjects = [
  Project(
    "Secret Vault",
    flutter,
    "https://github.com/insan2001/secret-vault",
    "An android app to hide your private photos and videos under a game.",
    valut,
  ),
  Project(
    "Tube Vanced",
    flutter,
    "https://github.com/insan2001/tube_vanced",
    "This is a minimal version of YouTube.",
    tubeVanced,
  ),
  Project(
    "ID-Safe-android",
    python,
    "https://github.com/insan2001/id-safe-android",
    "This apply an encryption to a file with certain pasword. This uses python kivy framework.",
    idsAndroid,
  ),
  Project(
    "ID-Safe-windows",
    python,
    "https://github.com/insan2001/id-safe-windows",
    "Its the same project as ID-Safe-android. Instead of kivy its uses tkinter.",
    idsWindows,
  ),
  Project(
    "Tic-tac-toe Pro",
    python,
    "https://github.com/insan2001/Tic-Tac-Toe-PRO",
    "Advance version of tic-tac-toe game based on command prompt/ terminal.",
    tttP,
  ),
  Project(
    "Tic-tac-toe Pro",
    flutter,
    "https://github.com/insan2001/tic_tac_toe_pro",
    "It's a GUI version of the above one.",
    tttF,
  ),
  Project(
    "This website",
    flutter,
    "https://github.com/insan2001/my_website",
    "This website",
    website,
  ),
];

final mySkills = [
  aftereffects,
  filmora,
  premierpro,
  photoShop,
  word,
  excel,
  git
];

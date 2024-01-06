import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/game/game_space.dart';
import 'package:my/widgets/about.dart';
import 'package:my/widgets/certificates.dart';
import 'package:my/widgets/experience.dart';
import 'package:my/widgets/languages.dart';
import 'package:my/widgets/my_home.dart';
import 'package:my/widgets/projects.dart';
import 'package:my/widgets/skills.dart';

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
  HomeWidget("Language", langs, langsHold, 1),
  HomeWidget("Projects", projects, projectsHold, 2),
  HomeWidget("Experience", exp, expHold, 3),
  HomeWidget("Skills", skill, skillHold, 4),
  HomeWidget("Certificates", certificates, certificatesHold, 5),
  HomeWidget("About", about, aboutHold, 6),
];

final myLanguages = [
  Language(html, "2017"),
  Language(python, "2019", verified: true),
  Language(javaScript, "2021"),
  Language(dart, "2022", verified: true),
];

final myProjects = [
  Project(
    "Secret Vault",
    flutter,
    "https://github.com/insan2001/secret-vault",
    "Hide your private photos and videos under a game.",
    android,
  ),
  Project(
    "Tube Vanced",
    flutter,
    "https://github.com/insan2001/tube_vanced",
    "A minimal version of YouTube",
    android,
  ),
  Project(
    "ID-Safe-android",
    python,
    "https://github.com/insan2001/id-safe-android",
    "Apply an encryption to a file with certain pasword. This uses python kivy framework.",
    android,
  ),
  Project(
    "ID-Safe-windows",
    python,
    "https://github.com/insan2001/id-safe-windows",
    "Its the same project as ID-Safe-android. Instead of kivy its uses tkinter.",
    cmd,
  ),
  Project(
    "Tic-tac-toe Pro",
    python,
    "https://github.com/insan2001/Tic-Tac-Toe-PRO",
    "Advance version of tic-tac-toe game based on command prompt/ terminal.",
    cmd,
  ),
  Project(
    "Tic-tac-toe Pro",
    flutter,
    "https://play.google.com/store/apps/details?id=com.insanj.tttp&pli=1",
    "It's an android version of the tic-tac-toe pro",
    android,
  ),
  Project(
    "This website",
    flutter,
    "https://github.com/insan2001/my_website",
    "This website",
    website,
  ),
];

final List<Widget> screens = [
  HomeScreen(key: dragKey),
  const Languages(),
  const Projects(),
  const Experience(),
  const Skills(),
  const MyCertificates(),
  const About(),
];

final mySkills = [
  flutter,
  aftereffects,
  filmora,
  premierpro,
  photoShop,
  word,
  excel,
  git
];

final myCertificates = [hackerRank];

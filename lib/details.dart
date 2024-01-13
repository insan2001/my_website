import 'package:flutter/material.dart';
import 'package:my/game/game_space.dart';
import 'package:my/widgets/about.dart';
import 'package:my/widgets/certificates.dart';
import 'package:my/widgets/experience.dart';
import 'package:my/widgets/languages.dart';
import 'package:my/widgets/my_home.dart';
import 'package:my/widgets/projects.dart';
import 'package:my/widgets/skills.dart';

final List<Widget> screens = [
  HomeScreen(key: dragKey),
  const Languages(),
  const Projects(),
  const Experience(),
  const Skills(),
  const MyCertificates(),
  const About(),
];

late final List homeWidget;
late final List myLanguages;
late final List myProjects;
late final List mySkills;
late final List myCertificates;

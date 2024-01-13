import 'package:flutter/material.dart';
import 'package:my/details.dart';
import 'package:my/function/json_reader.dart';
import 'package:my/game/game_space.dart';
import 'package:my/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  index = 0;
  homeWidget = (await readJson("assets/jsons/home.json"))["home"]!;

  myLanguages = (await readJson("assets/jsons/langs.json"))["langs"]!;

  myProjects = (await readJson("assets/jsons/project.json"))["projects"]!;

  mySkills = (await readJson("assets/jsons/skills.json"))["skills"]!;

  myCertificates =
      (await readJson("assets/jsons/certificates.json"))["certificates"]!;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

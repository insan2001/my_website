import 'package:flutter/material.dart';
import 'package:my/game/game_space.dart';
import 'package:my/notify.dart';
import 'package:my/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  index = 0;
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
      home: HomeScreen(),
    );
  }
}

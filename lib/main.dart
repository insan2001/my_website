import 'package:flutter/material.dart';
import 'package:my/screens/home.dart';

final homeKey = GlobalKey<HomeScreenState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        key: homeKey,
      ),
    );
  }
}

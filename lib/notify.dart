// import 'package:flutter/material.dart';
// import 'package:my/constants.dart';

// class MyNotifier extends ChangeNotifier {
//   int index = 0;
//   late double screenWidth;
//   late double screenHeight;
//   late double tableWidth;
//   late double tableHeight;
//   late double topPosition;
//   late double doorWidth;
//   late double dropZone;
//   late double hiddenSize;
//   late bool isMobile;

//   switchTo(int newIndex) async {
//     myKey.currentState?.toggleFold();
//     await Future.delayed(const Duration(milliseconds: 1000));
//     setState(() {
//       hiddenSize = size;
//     });
//     await Future.delayed(const Duration(milliseconds: 200));
//     setState(() {
//       index = indexInput;
//     });
//     await Future.delayed(const Duration(milliseconds: 200));
//     setState(() {
//       hiddenSize = 0;
//     });
//   }

//   init(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     screenWidth = screenSize.width;
//     screenHeight = screenSize.height;
//     isMobile = screenWidth <= 640;

//     tableWidth = isMobile ? screenWidth - widthSocial : screenWidth / 2;
//     tableHeight = isMobile ? screenHeight : screenWidth / 3;
//     topPosition = isMobile ? 0 : (screenHeight - tableHeight) / 2;
//     doorWidth = tableWidth * 2 / 5;
//     dropZone = doorWidth / 9;
//   }

//   changeIndex(int newIndex) {
//     index = newIndex;
//     notifyListeners();
//   }
// }

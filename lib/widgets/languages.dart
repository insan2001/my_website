import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/details.dart';
import 'package:my/game/game_space.dart';

class Languages extends StatelessWidget {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width <= 640 ? 3 : 5,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(myLanguages.length, (index) {
          Language currentLang = myLanguages[index];
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.all(tableHeight / 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: tableWidth / 200,
                    color: langBorder,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: langBg,
                  radius: tableWidth,
                  foregroundImage: Image.asset(
                    currentLang.img,
                  ).image,
                ),
              ),
              currentLang.verified
                  ? Positioned(
                      top: isMobile ? 20 : 0,
                      left: isMobile ? 20 : 0,
                      child: Icon(
                        Icons.verified_rounded,
                        color: langVerified,
                        size: isMobile ? tableWidth / 15 : tableWidth / 20,
                      ),
                    )
                  : Container(),
              Positioned(
                  top: isMobile ? 20 : 0,
                  right: isMobile ? 20 : 0,
                  child: Container(
                    padding: EdgeInsets.all(tableWidth / 100),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 129, 22, 14),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      currentLang.year,
                      style: TextStyle(
                          color: Colors.white, fontSize: tableWidth / 50),
                    ),
                  ))
            ],
          );
        }));
  }
}

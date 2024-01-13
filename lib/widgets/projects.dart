import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/details.dart';
import 'package:my/function/lauch_url.dart';
import 'package:my/game/game_space.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    double boxSize = isMobile ? tableWidth / 2 : tableHeight / 2;
    return GridView.count(
      crossAxisCount:
          isMobile || MediaQuery.of(context).size.width <= 640 ? 2 : 4,
      children: List.generate(myProjects.length, (index) {
        Map<String, dynamic> currentProject = myProjects[index];
        return Card(
          color: projectBg,
          elevation: 10,
          child: FlipCard(
            flipOnTouch: true,
            back: Center(
              child: Padding(
                padding: EdgeInsets.all(boxSize / 20),
                child: Text(
                  currentProject["description"],
                  style: TextStyle(
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile
                          ? MediaQuery.of(context).size.width / 30
                          : MediaQuery.of(context).size.width / 90),
                ),
              ),
            ),
            front: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      currentProject["platformImage"],
                      width: isMobile ? boxSize * 0.65 : boxSize / 2,
                      height: isMobile ? boxSize * 0.65 : boxSize / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: boxSize / 100),
                  child: Text(
                    currentProject["name"],
                    style: TextStyle(
                        fontSize: isMobile
                            ? MediaQuery.of(context).size.width / 20
                            : MediaQuery.of(context).size.width / 80),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    currentProject["image"],
                    width: boxSize / 6,
                    height: boxSize / 6,
                    color: projectLang,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.link,
                      color: Colors.black,
                      size: isMobile ? boxSize / 6 : boxSize / 8,
                    ),
                    onPressed: () {
                      launchMyUrl(currentProject["url"]);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

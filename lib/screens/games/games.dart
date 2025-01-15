import 'package:dipra/screens/games/puzzle/puzzle_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../fetching_colouringbook.dart';
import '../../style_.dart';
import '../../values/app_icons.dart';
import 'maze/maze.dart';
import 'memory_flip/memory_flip.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => GamesState();
}

class GamesState extends State<Games> {

  final List<Map<String, dynamic>> GameData = [
    {
      'image': "assets/jigsaw.png",
      'name': translate('home.games.1'),
      'color' : const Color(0xFFBDB0E1),
    },
    {
      'image': "assets/maze.png",
      'name': translate('home.games.2'),
      'color' : const Color(0xFFF1D5D5),
    },
    {
      'image': "assets/card-game.png",
      'name': translate('home.games.3'),
      'color' : const Color(0xFFCEEAFF),
    },
    {
      'image': "assets/sketchbook.png",
      'name': translate('home.games.4'),
      'color' : const Color(0xFFFFF4BD),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0XFFFD0D1FF),
        title:  Text(translate('home.games.title'), style: TextStyle(fontSize: appbar_size, fontWeight: FontWeight.w800,), textAlign: TextAlign.center,),
        centerTitle: true,
          leading: IconButton(onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
            icon: SvgPicture.asset(AppIcons.LEFTARROW,
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //     width: MediaQuery.of(context).size.width,
              //     height: 200,
              //     child: Image.asset("assets/games.gif",fit: BoxFit.contain,)
              // ),
              const SizedBox(height: 30),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GameTitle(
                    image: GameData[0]['image'],
                    name: GameData[0]['name'],
                  ),
                  const SizedBox(width: 30,),
                  GameTitle(
                    image: GameData[1]['image'],
                    name: GameData[1]['name'],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GameTitle(
                    image: GameData[2]['image'],
                    name: GameData[2]['name'],
                  ),
                  const SizedBox(width: 30,),
                  GameTitle(
                    image: GameData[3]['image'],
                    name: GameData[3]['name'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameTitle extends StatelessWidget {
  final String image;
  final String name;


  const GameTitle({super.key,
    required this.image,
    required this.name,

  });

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> Pages = {"Puzzle": Jigsaw_Start_Page(points: points,), "Match The Following" : MatchColumn2(points: points,) , "Quiz": QuizScreen(points: points,), "Story Mode": ScenarioStartScreen()};
    return GestureDetector(
      onTap: () {
        if(image.contains("maze.png")){
          maze_game(context);
        }
        else if(image.contains("sketchbook.png")){
          drawing_book(context);
        }
        else if(image.contains("jigsaw.png")){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Puzzle_Selection()),
          );
        }
        else{
          memory_game(context);
        }
      },
      child :
      Container(
          margin: const EdgeInsets.only(bottom: 30),
          padding: const EdgeInsets.all(0),
          width: 130,
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:  Color(0XFFFD0D1FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2, color: Colors.grey.withOpacity(0.35)),
            boxShadow: [
              BoxShadow(
                color:  Color(0XFFFD0D1FF).withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    // color: color,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  ),
                  child: Image.asset(image, width: 70, height: 70,)
                // child : SvgPicture.asset(image, width: 70, height: 70,),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20,),
            ],
          )
      ),
    );
  }

  Future memory_game(BuildContext context){
    return showDialog(context: context,
        builder: (ctx) =>
            AlertDialog(
                title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center,),
                content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                actions: <Widget> [
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MemoryFlip(level: 'easy',)));

                            }, child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0XFFFEEC1C1),

                          ),
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: 18)),

                        )
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MemoryFlip(level: 'intermediate',)));

                            }, child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0XFFFEEC1C1),

                          ),
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: 18)),

                        )
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => MemoryFlip(level: 'hard',)));
                          }, child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                color: Color(0XFFFEEC1C1)
                            ),
                            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                            child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: 18),
                            )
                        ),
                        )],
                    ),
                  ),

                ]
            )
    );
  }

  Future maze_game(BuildContext context){
    return showDialog(context: context,
        builder: (ctx) =>
            AlertDialog(
                title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center,),
                content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: 16),),
                actions: <Widget> [
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MazeGame(level: 'easy',)));

                            }, child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0XFFFEEC1C1),

                          ),
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: 18)),

                        )
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MazeGame(level: 'intermediate',)));

                            }, child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0XFFFEEC1C1),

                          ),
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: 18)),

                        )
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => MazeGame(level: 'hard',)));
                          }, child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                color: Color(0XFFFEEC1C1)
                            ),
                            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                            child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: 18),
                            )
                        ),
                        )
                      ],
                    ),
                  ),

                ]
            )
    );
  }

  Future drawing_book(BuildContext context){
    return showDialog(context: context,
        builder: (ctx) =>
            AlertDialog(
                title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center,),
                content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: 16),),
                actions: <Widget> [
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ColouringBookEasy(level: 'easy', collection_name: "drawings_easy",)));

                            }, child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0XFFFEEC1C1),

                          ),
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: 18)),

                        )
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ColouringBookEasy(level: 'intermediate', collection_name: "drawings_intermediate",)));

                            }, child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0XFFFEEC1C1),

                          ),
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: 18)),

                        )
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ColouringBookEasy(level: 'hard', collection_name: "drawings_hard",)));
                          }, child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                color: Color(0XFFFEEC1C1)
                            ),
                            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                            child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: 18),
                            )
                        ),
                        )
                      ],
                    ),
                  ),

                ]
            )
    );
  }
}

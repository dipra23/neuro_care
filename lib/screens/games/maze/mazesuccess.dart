import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../auth/user_model.dart';
import '../../../auth/user_repository.dart';
import '../../../homepage/bottomnavigation.dart';
import '../../../widgets/question_formats/indexUpdate.dart';
import 'maze.dart';

class MazeSuccess extends StatefulWidget {

  const MazeSuccess({Key? key, required this.level}) : super(key: key);
  final String level;

  @override
  _MazeSuccessState createState() => _MazeSuccessState();
}

class _MazeSuccessState extends State<MazeSuccess> {

  final controller = ConfettiController();
  final userRepo = UserRepository();
  void updatePoints(Points_Update_Model user, String? uid){
    userRepo.updatePoints(user, uid);
  }
  User? user_ = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    int points = widget.level == "easy" ? 5 :
    widget.level == "intermediate" ? 7 : 10;
    current_points += points;
    total_points += current_points;
    current_points = 0;

    final user = Points_Update_Model(
        total_points: total_points,
        meditation: meditation,
        hard_puzzles: hard_puzzles,
        quizzes: quizzes,
        locations_360: locations_360,
        drawings: drawings,
        puzzle_number: puzzle_number,
        sounds: sounds,
        languages: languages,
        current_points: current_points
    );
    updatePoints(user, user_?.uid);
    super.initState();
    controller.play();
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 200,
                      padding: const EdgeInsets.all(10.0),
                      child:Column(
                        children: [
                          Text(translate('success.title'),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20,),
                          Text(translate('success.msg'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        ],
                      ),
                    ),
                    Container(
                      child:widget.level== 'easy' ?
                      Text(translate('success.easy_points'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700), textAlign: TextAlign.center,):
                      widget.level== 'intermediate' ?
                      Text(translate('success.intermediate_points'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700), textAlign: TextAlign.center,):
                      Text(translate('success.hard_points'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                      width: 200,
                      padding: const EdgeInsets.all(10.0),
                      // margin: const EdgeInsets.all(20.0),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        showDialog(context: context,
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
                                      )],
                                  ),
                                ),

                              ]
                            )
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0XFFFF5DEDE),
                            borderRadius: BorderRadius.all(Radius.circular(23))
                        ),
                        child: Text(
                          translate('puzzles.play_again_btn'),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BottomNavigationExample()),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0XFFFD0D1FF),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          translate('puzzles.home_btn'),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ),
          ConfettiWidget(
              confettiController: controller,
              shouldLoop: true,
              blastDirectionality: BlastDirectionality.explosive
          )
        ]
    );
  }
}
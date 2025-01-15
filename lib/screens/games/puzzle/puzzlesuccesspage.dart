import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../../style_.dart';
import '/homepage/bottomnavigation.dart';
import '/screens/games/puzzle/puzzle_firestore.dart';
import '/widgets/question_formats/fetching_questions.dart';

import '../../../auth/user_model.dart';
import '../../../auth/user_repository.dart';
import '../../../widgets/question_formats/indexUpdate.dart';

class PuzzleCongrats extends StatefulWidget{
  const PuzzleCongrats({Key? key, required this.gridsize}) : super(key: key);
  final int  gridsize;

  @override
  State<StatefulWidget> createState() {
    return _PuzzleCongratsState();
  }

}

class _PuzzleCongratsState extends State<PuzzleCongrats>{
  int points= 0;
  bool isPlaying= false;
  final controller = ConfettiController();
  final userRepo = UserRepository();
  void updatePoints(Points_Update_Model user, String? uid){
    userRepo.updatePoints(user, uid);
  }
  User? user_ = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    int points = widget.gridsize == 3 ? 5 :
    widget.gridsize == 4 ? 7 : 10;
    current_points += points;
    total_points += current_points;
    current_points = 0;
    puzzle_number++;
    if (widget.gridsize == 5) {
      hard_puzzles++;
    }

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
        alignment: Alignment.topCenter
        ,
        children: [Scaffold(
            body:
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 200,
                      padding: const EdgeInsets.all(10.0),
                      // margin: const EdgeInsets.fromLTRB(20, 150, 20, 20),

                      child:Column(
                        children: [
                          Text(translate('success.title'),
                            style: TextStyle(fontSize: title_size + 1, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20,),
                          Text(translate('success.msg'), style: TextStyle(fontSize: para_size + 2, fontWeight: FontWeight.w700),),
                        ],
                      ),
                    ),
                    Container(
                      child:widget.gridsize== 3?
                      Text("+ 5 POINTS", style: TextStyle(fontSize: para_size + 2, fontWeight: FontWeight.w700), textAlign: TextAlign.center,):
                      widget.gridsize== 4?
                      Text("+ 7 POINTS", style: TextStyle(fontSize: para_size + 2, fontWeight: FontWeight.w700), textAlign: TextAlign.center,):
                      Text("+ 10 POINTS", style: TextStyle(fontSize: para_size + 2, fontWeight: FontWeight.w700), textAlign: TextAlign.center,)
                      ,
                      width: 200,
                      padding: const EdgeInsets.all(10.0),
                      // margin: const EdgeInsets.all(20.0),
                      ),
                    SizedBox(height: 20,),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>Puzzle_Selection()));
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
            )
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


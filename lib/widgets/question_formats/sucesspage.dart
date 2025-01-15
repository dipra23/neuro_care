import 'package:confetti/confetti.dart';
import 'package:dipra/homepage/homepage.dart';
import 'package:dipra/style_.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../auth/user_model.dart';
import '../../auth/user_repository.dart';
import '/homepage/bottomnavigation.dart';
import '/screens/identification/identification.dart';
import '/widgets/question_formats/fetching_questions.dart';

import 'indexUpdate.dart';

class Congratulations extends StatefulWidget{
  const Congratulations({Key? key, required this.category, required this.collection_name, required this.level}) : super(key: key);
  final String category;
  final String level;
  final String collection_name;

  @override
  State<StatefulWidget> createState() {
    return _CongratulationsState();
  }
}

class _CongratulationsState extends State<Congratulations>{
  int points= 0;
  bool isPlaying= false;
  final controller = ConfettiController();

  final userRepo = UserRepository();
  void updatePoints(Points_Update_Model user, String? uid){
    userRepo.updatePoints(user, uid);
  }
  User? user_ = FirebaseAuth.instance.currentUser;

  @override
  void initState(){
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
      alignment: Alignment.topCenter,
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
                child:widget.level== 'easy'?
                Text(translate('success.easy_points'), style: TextStyle(fontSize: para_size + 2, fontWeight: FontWeight.w700), textAlign: TextAlign.center,):
                  widget.level== 'intermediate'?
                Text(translate('success.intermediate_points'), style: TextStyle(fontSize: para_size + 2, fontWeight: FontWeight.w700), textAlign: TextAlign.center,):
                Text(translate('success.hard_points'), style: TextStyle(fontSize: para_size + 2, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                width: 200,
                padding: const EdgeInsets.all(10.0),
                // margin: const EdgeInsets.all(20.0),

              ),
                  SizedBox(height: 20,),
                 GestureDetector(
                   onTap: () async {
                     print(widget.collection_name);
                     print(widget.category);
                     print(widget.level);
                     int points = widget.level== 'easy' ? 5:
                     widget.level== 'intermediate' ? 7: 10;
                     current_points += points;
                     print("current points $current_points");
                     if(index<=4){
                         Navigator.pushReplacement(context,
                             MaterialPageRoute(builder: (context) =>
                                 question_answers(
                                     collection_name: widget.collection_name,
                                     category: widget.category,
                                     level: widget.level
                                 )
                             )
                         );
                     }
                     else {
                       index= 0;
                       total_points += current_points;
                       print("total points $total_points");
                       print(widget.category);
                       if(widget.category.toLowerCase().contains("360")) {
                         locations_360 += 1;
                       }
                       else if (widget.category.toLowerCase().contains("SOUNDS".toLowerCase())) {
                         sounds += 1;
                       } else if(widget.category.toLowerCase().contains("languages")){
                         languages++;
                       }
                       print(sounds);
                       quizzes +=1;
                       await showDialog(
                         context: context,
                         builder: (BuildContext context) {
                           return AlertDialog(
                             title: Text(''),
                             content: Text('${translate('success.complete_msg')} $current_points',
                               style: TextStyle(fontWeight: FontWeight.w600, fontSize: para_size + 2), textAlign: TextAlign.center,),
                             actions: <Widget>[
                               TextButton(
                                 onPressed: () {
                                   Navigator.of(context).pop();
                                 },
                                 child: Text(translate('success.complete_btn')),
                               ),
                             ],
                           );
                         },
                       );
                       print("completion");
                       current_points = 0;
                       final user= Points_Update_Model(
                           total_points: total_points,
                           meditation: meditation,
                           hard_puzzles: hard_puzzles,
                           quizzes: quizzes,
                           locations_360: locations_360,
                           drawings: drawings,
                           puzzle_number: puzzle_number,
                           sounds: sounds,
                           languages: languages,
                           current_points: current_points);
                       updatePoints(user, user_?.uid);
                       if(widget.category.toLowerCase().contains("languages")){
                         Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => BottomNavigationExample()),);
                       }
                       else {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Identification()));
                       }
                     }
                     },
                     child: Container(
                       width: 250,
                       padding: const EdgeInsets.all(10.0),
                       margin: const EdgeInsets.all(20.0),
                      child:Text(translate('success.continue_btn'), textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: button_size + 1),),
                          decoration: BoxDecoration(
                              color: Color(0XA303AC13),
                                   borderRadius: BorderRadius.all(Radius.circular(23))
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

  void _showCompletionDialog(BuildContext context) {

  }

}


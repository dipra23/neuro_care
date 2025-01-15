import 'package:dipra/style_.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../auth/user_model.dart';
import '../../auth/user_repository.dart';
import '/screens/identification/identification.dart';

import '../../homepage/bottomnavigation.dart';
import 'fetching_questions.dart';
import 'indexUpdate.dart';

class Fail extends StatefulWidget{
  const Fail({Key? key, required this.answer, required this.category, required this.collection_name, required this.level}) : super(key: key);
final String answer;
final String category;
  final String level;
  final String collection_name;
  @override
  State<StatefulWidget> createState() {
    return _FailState();
  }

}

class _FailState extends State<Fail>{

  final userRepo = UserRepository();
  void updatePoints(Points_Update_Model user, String? uid){
    userRepo.updatePoints(user, uid);
  }
  User? user_ = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child:
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    // margin: const EdgeInsets.fromLTRB(20, 150, 20, 20),
                    alignment: Alignment.center,
                    child:Column(
                      children: [
                        Text(translate('fail.title'),
                          style: TextStyle(fontSize: title_size + 2, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10,),
                        (widget.answer.contains("https://"))? Image.network(widget.answer, width: 100, height: 100,):
                        Text("${widget.answer}",
                          style: TextStyle(fontSize: para_size + 2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20,),
          
                        Text(translate('fail.msg'), style: TextStyle(fontSize: para_size + 2, fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
          
                  GestureDetector(
                    onTap: () async {
                      if(index<=4) {
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
                            content: Text('${translate('fail.complete_msg')} $current_points',
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18), textAlign: TextAlign.center,),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(translate('fail.complete_btn')),
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
                      // height: 50,
                      width: 250,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(20.0),
                      child:Text(translate('fail.continue_btn'), textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: button_size + 1),),
                      decoration: BoxDecoration(
                          color: Color(0XFFFF5DEDE),
                          borderRadius: BorderRadius.all(Radius.circular(23))
                      ),
                    ),
                  ),
                ]
          ),
        )
    );
  }
}
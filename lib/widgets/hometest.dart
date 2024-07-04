import 'package:flutter/material.dart';
import 'package:flutter_jigsaw_puzzle/flutter_jigsaw_puzzle.dart';
import 'package:neuro_care/widgets/choosedrawing.dart';
import 'package:neuro_care/widgets/howto.dart';
import 'package:neuro_care/widgets/learn_something_new.dart';
import 'package:neuro_care/widgets/oneclock.dart';
import 'package:neuro_care/widgets/question_format_one.dart';
import 'package:neuro_care/widgets/question_format_two.dart';
import 'package:one_clock/one_clock.dart';

import 'identification.dart';

class HomeTest extends StatefulWidget {  @override
  State<StatefulWidget> createState() {
    return _HomeTestState();
  }
}

class _HomeTestState extends State<HomeTest>{
  List pages =[ Identification(), HowTo(), QuestionFormatTwo(), QuestionFormatOne(), LearnSomethingNew(), ChooseDrawing(), AnalogClock(), OneClock()
  ];
  List pagenames =[ "Identification", "HowTo", "QuestionFormatTwo", "QuestionFormatOne", "LearnSomethingNew", "ChooseDrawing", "AnalogClock",
    "OneClock"
  ];
  Widget ButtonReturn (int index){
    return ElevatedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pages[index]),
          );
        },
        child: Text(pagenames[index]));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return ButtonReturn(index);

        }
    ));
  }

}


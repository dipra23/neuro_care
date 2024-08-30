import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/widgets/fetching_questions.dart';
import 'fetching_questions.dart';

import '../radiolisttexts.dart';
import '../values/app_icons.dart';
class QuestionFormatTwo extends StatefulWidget{
  const QuestionFormatTwo({Key? key, required this.question,required this.option2,required this.option3,
    required this.option0, required this.level, required this.option1, required this.category, required this.answer, required this.url}) : super(key: key);
  final String question;
  final String option0;
  final String level;
  final String option1;
  final String option2;
  final String option3;
  final String category;
  final int answer;
  final String url;
  @override
  State<StatefulWidget> createState() {
    return _QuestionFormatTwoState();
  }

}

class _QuestionFormatTwoState extends State<QuestionFormatTwo>{
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFC9EBED),
          title: Text(widget.category, textAlign: TextAlign.center,),
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
      body:
    Column(
    children: [
    Container(
    height: size.height*0.2,
    alignment: Alignment.center,
    padding: EdgeInsets.all(25),
    child:Text(widget.question,
    style: TextStyle(fontSize: 25),
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center),
    ),
    Container(
      margin: const EdgeInsets.all(20.0),
      child:  Image.network(
         widget.url, height: 100, width: 200,
      ),

      ),
      RadioListText(option2: widget.option2, option3: widget.option3,
        option0: widget.option0, option1: widget.option1, answer: widget.answer, level: widget.level,),






    ]
    ));
  }
}
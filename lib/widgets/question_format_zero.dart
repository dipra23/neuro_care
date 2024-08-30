import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_care/failpage.dart';
import 'package:neuro_care/widgets/radiolistimages.dart';
import 'package:neuro_care/widgets/sucesspage.dart';

import '../radiolisttexts.dart';
import '../values/app_icons.dart';

class QuestionFormatZero extends StatefulWidget{
  const QuestionFormatZero({Key? key, required this.question,required this.option2,required this.option3,
    required this.option0, required this.level, required this.option1, required this.answer, required this.category}) : super(key: key);
  final String question;
  final String option0;
  final String level;
  final String option1;
  final String option2;
  final String option3;
   final int answer;
  final String category;



  @override
  State<StatefulWidget> createState() {
    return _QuestionFormatZeroState();
  }

}
class _QuestionFormatZeroState extends State<QuestionFormatZero>{




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
      body: Column(
        children: [
          Container(
            height: size.height*0.3,
            width: size.width*0.75,
            alignment: Alignment.center,
            padding: EdgeInsets.all(25),
            child:Text(widget.question,
                style: TextStyle(fontSize: 25),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center),
          ),
          Container(
            height: size.height*0.5,
            child:       RadioListText(option2: widget.option2, option3: widget.option3,
              option0: widget.option0, option1: widget.option1, answer: widget.answer, level: widget.level,)

          ),


        ],


      ),
    );
  }

}

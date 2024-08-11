import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_care/radiolisttexts.dart';
import 'package:neuro_care/screens/meditation/meditation_caller.dart';
import 'package:neuro_care/widgets/radiolistimages.dart';

import '../values/app_icons.dart';
import 'audioplayer/question_audio_caller.dart';

class QuestionFormatFour extends StatefulWidget{
  const QuestionFormatFour({Key? key, required this.question,required this.option2,required this.option3,
    required this.option0, required this.option1, required this.answer, required this.category, required this.url}) : super(key: key);
  final String question;
  final String option0;
  final String option1;
  final String option2;
  final String option3;
  final int answer;
  final String category;
  final String url;
  @override
  State<StatefulWidget> createState() {
    return _QuestionFormatFourState();
  }

}
class _QuestionFormatFourState extends State<QuestionFormatFour>{
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
            height: size.height*0.2,
            width: size.width*0.75,
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(2, 5, 5, 5),
            child:Text(widget.question,

                overflow: TextOverflow.visible,
                textAlign: TextAlign.center),
          ),
          Container(
            height: size.height*0.2,
            width: size.width*0.8,
            child: QuestionPlayer( url: widget.url,)
          ),
          RadioListText(option2: widget.option2, option3: widget.option3,
              option0: widget.option0, option1: widget.option1, answer: widget.answer),

        ],


      ),
    );
  }

}
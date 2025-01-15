import 'package:dipra/screens/identification/identification.dart';
import 'package:dipra/style_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:string_capitalize/string_capitalize.dart';
import '/widgets/question_formats/failpage.dart';
import '/widgets/question_formats/radiolistimages.dart';
import '/widgets/question_formats/sucesspage.dart';

import 'indexUpdate.dart';
import 'radiolisttexts.dart';
import '../../values/app_icons.dart';

class QuestionFormatZero extends StatefulWidget{
  const QuestionFormatZero({Key? key, required this.question,required this.option2,required this.option3,
    required this.option0, required this.level, required this.option1, required this.answer, required this.category, required this.collection_name}) : super(key: key);
  final String question;
  final String option0;
  final String level;
  final String option1;
  final String option2;
  final String option3;
   final int answer;
  final String category;
  final String collection_name;


  @override
  State<StatefulWidget> createState() {
    return _QuestionFormatZeroState();
  }

}
class _QuestionFormatZeroState extends State<QuestionFormatZero>{

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    String q = translate('${widget.collection_name}.0.${widget.question.replaceAll(".", ";")}.question');
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFC9EBED),
          title: Text(translate('${widget.collection_name}.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            setState(() {
              index = 0;
              Navigator.push(context,MaterialPageRoute(builder: (context) => Identification()));
            });
          },
            icon: SvgPicture.asset(AppIcons.LEFTARROW,
            ),
          )
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              // height: size.height*0.3,
              // width: size.width*0.75,
              alignment: Alignment.center,
              padding: EdgeInsets.all(25),
              child:Text(q.toString().capitalize(),
                  style: TextStyle(fontSize: title_size, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center),
            ),
            SizedBox(height: 20,),
            Container(
              // height: size.height*0.5,
              child: RadioListText(option2: translate('${widget.collection_name}.0.${widget.question.replaceAll(".", ";")}.option2').toString().capitalize(), option3: translate('${widget.collection_name}.0.${widget.question.replaceAll(".", ";")}.option3').toString().capitalize(),
                option0: translate('${widget.collection_name}.0.${widget.question.replaceAll(".", ";")}.option0').toString().capitalize(), option1: translate('${widget.collection_name}.0.${widget.question.replaceAll(".", ";")}.option1').toString().capitalize(), answer: widget.answer, level: widget.level, collection_name: widget.collection_name, category: widget.category,
              )
            ),
          ],
        ),
      ),
    );
  }
}

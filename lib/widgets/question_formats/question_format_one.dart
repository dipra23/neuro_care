import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:string_capitalize/string_capitalize.dart';
import '../../screens/identification/identification.dart';
import '/widgets/question_formats/radiolistimages.dart';

import '../../values/app_icons.dart';
import 'indexUpdate.dart';

class QuestionFormatOne extends StatefulWidget{
  const QuestionFormatOne({Key? key, required this.question,required this.option2,required this.option3,
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
    return _QuestionFormatOneState();
  }
}

class _QuestionFormatOneState extends State<QuestionFormatOne>{
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    String q = translate('${widget.collection_name}.1.${widget.question.replaceAll(".", ";")}');
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              // height: size.height*0.3,
              // width: size.width*0.75,
              alignment: Alignment.center,
              padding: EdgeInsets.all(25),
              child:Text(
                q.toString().capitalize(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center
              ),
            ),
            SizedBox(height: 20,),
            Container(
              // height: size.height*0.5,
              child: RadioList(option2: widget.option2, option3: widget.option3,
                  option0: widget.option0, option1: widget.option1, answer: widget.answer, category: widget.category, level: widget.level, collection_name: widget.collection_name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

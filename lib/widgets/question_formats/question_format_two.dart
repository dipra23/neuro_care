import 'package:cached_network_image/cached_network_image.dart';
import 'package:dipra/style_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:string_capitalize/string_capitalize.dart';
import '../../screens/identification/identification.dart';
import '/widgets/question_formats/fetching_questions.dart';
import 'fetching_questions.dart';

import 'indexUpdate.dart';
import 'radiolisttexts.dart';
import '../../values/app_icons.dart';
class QuestionFormatTwo extends StatefulWidget{
  const QuestionFormatTwo({Key? key, required this.question,required this.option2,required this.option3,
    required this.option0, required this.level, required this.option1, required this.category,  required this.answer, required this.url, required this.collection_name}) : super(key: key);
  final String question;
  final String option0;
  final String level;
  final String option1;
  final String option2;
  final String option3;
  final String category;
  final int answer;
  final String url;
  final String collection_name;
  @override
  State<StatefulWidget> createState() {
    return _QuestionFormatTwoState();
  }
}

class _QuestionFormatTwoState extends State<QuestionFormatTwo>{
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    String key_ = '${widget.collection_name}.2.${widget.url.split("/").last.split(".").first}';
    String q = translate('${key_}.question');
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
      body:
    Container(
      child: Column(
      children: [
        SizedBox(height: 50,),
      Container(
      // height: size.height*0.2,
      alignment: Alignment.center,
      padding: EdgeInsets.all(25),
      child:Text(q.toString().capitalize(),
      style: TextStyle(fontSize: title_size, fontWeight: FontWeight.w700),
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center),
      ),
      SizedBox(height: 10,),
      Container(
        child:  Image.network(
           widget.url, height: 100, width: 200,
        ),
        ),
        SizedBox(height: 30,),
        RadioListText(option2: translate('$key_.option2').toString().capitalize(), option3: translate('$key_.option3').toString().capitalize(),
          option0: translate('$key_.option0').toString().capitalize(), option1: translate('$key_.option1').toString().capitalize(), answer: widget.answer, level: widget.level, collection_name: widget.collection_name, category: widget.category, ),
      ]
      ),
    ));
  }
}
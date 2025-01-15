import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:string_capitalize/string_capitalize.dart';
import '../../screens/identification/identification.dart';
import '/widgets/question_formats/radiolisttexts.dart';
import '/screens/meditation/meditation_caller.dart';
import '/widgets/question_formats/radiolistimages.dart';

import '../../values/app_icons.dart';
import '../audioplayer/question_audio_caller.dart';
import 'indexUpdate.dart';

class QuestionFormatFour extends StatefulWidget{
  const QuestionFormatFour({Key? key, required this.question,required this.option2,required this.option3,
    required this.option0, required this.level, required this.option1, required this.answer, required this.category, required this.collection_name, required this.url}) : super(key: key);
  final String question;
  final String option0;
  final String level;
  final String option1;
  final String option2;
  final String option3;
  final int answer;
  final String category;
  final String url;
  final String collection_name;
  @override
  State<StatefulWidget> createState() {
    return _QuestionFormatFourState();
  }

}
class _QuestionFormatFourState extends State<QuestionFormatFour>{
  @override
  Widget build(BuildContext context) {
    String key_ = '${widget.collection_name}.4.${widget.url.split("/").last.split(".").first}';
    String q = translate('${key_}.question');
    final size= MediaQuery.of(context).size;
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
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            // height: size.height*0.2,
            // width: size.width*0.75,
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(2, 5, 5, 5),
            child:Text(q.toString().capitalize(),
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center),
          ),
          // SizedBox(height: 20,),
          Container(
            height: size.height*0.2,
            width: size.width*0.8,
            child: QuestionPlayer( url: widget.url,)
          ),
          SizedBox(height: 20,),
          RadioListText(option2: translate('${key_}.option2').toString().capitalize(), option3: translate('${key_}.option3').toString().capitalize(),
              option0: translate('${key_}.option0').toString().capitalize(), option1: translate('${key_}.option1').toString().capitalize(), answer: widget.answer, level: widget.level,collection_name: widget.collection_name, category: widget.category),

        ],


      ),
    );
  }

}

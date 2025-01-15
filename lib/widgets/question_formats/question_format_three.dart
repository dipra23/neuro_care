import 'package:cached_network_image/cached_network_image.dart';
import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:string_capitalize/string_capitalize.dart';
import '../../screens/identification/identification.dart';
import '/widgets/question_formats/radiolistimages.dart';

import 'indexUpdate.dart';
import 'radiolisttexts.dart';
import '../../values/app_icons.dart';
class QuestionFormatThree extends StatefulWidget{
  const QuestionFormatThree({Key? key, required this.question,required this.option2,required this.option3,
    required this.option0, required this.level, required this.option1, required this.answer, required this.url, required this.category, required this.collection_name}) : super(key: key);
  final String question;
  final String option0;
  final String level;
  final String option1;
  final String option2;
  final String option3;
  final int answer;
  final String url;
  final String category;
  final String collection_name;

  @override
  State<StatefulWidget> createState() {
    return _QuestionFormatThreeState();
  }

}

class _QuestionFormatThreeState extends State<QuestionFormatThree>{
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    String key_ = '${widget.collection_name}.3.${widget.url.split("/").last.split(".").first}';
    String q = translate('${key_}');
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
        SingleChildScrollView(
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
                  //margin: const EdgeInsets.all(5.0),
                    child: Image.network(
                  widget.url, height: 100, width: 200,
                ),),
                SizedBox(height: 30,),
                Container(
                  // height: size.height*0.5,
                  child: RadioList(option2: widget.option2, option3: widget.option3,
                      option0: widget.option0, option1: widget.option1, answer: widget.answer, category: widget.category,collection_name: widget.collection_name, level: widget.level,
          
                  ),
                ),
              ]
          ),
        ));
  }
}
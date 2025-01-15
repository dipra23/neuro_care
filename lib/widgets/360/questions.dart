import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../screens/identification/identification.dart';
import '../../values/app_icons.dart';
import '/widgets/360/360imageplayer.dart';

import '../question_formats/failpage.dart';
import '../question_formats/indexUpdate.dart';
import '../question_formats/sucesspage.dart';

final FirebaseFirestore firestore= FirebaseFirestore.instance;

class question_answers_360 extends StatefulWidget{
  const question_answers_360({Key? key, required this.question,required this.option2,required this.option3,
    required this.option0, required this.level, required this.image_url, required this.option1, required this.answer, required this.category, required this.collection_name}) : super(key: key);
  final String question;
  final String option0;
  final String level;
  final String image_url;
  final String option1;
  final String option2;
  final String option3;
  final int answer;
  final String category;
  final String collection_name;

  @override
  State<StatefulWidget> createState() {
    return _Question_AnswersState();
  }
}

class _Question_AnswersState extends State<question_answers_360> {

  int _options = -1;
  
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    String key_ = '${widget.collection_name}.${widget.image_url.split("/").last.split(".").first}';
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
                  Column(
                      children: [
                        Container(
                          height: size.height*0.2,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(25),
                          child:Text(translate('${key_}.question'),
                              style: TextStyle(fontSize: 25),
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PanoramaView(imageurl:widget.image_url,)));
                          },
                          child: Container(
                            child:  Image.network(
                              widget.image_url, height: 100, width: 200,
                            ),

                          ),
                        ),
                        Column(children: [
                          ListTile(
                            title: Text(translate('${key_}.option0')),
                            leading: Radio(
                              value: 0,
                              groupValue: _options,
                              onChanged: ( value) {

                                setState(() {
                                  _options = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(translate('${key_}.option1')),
                            leading: Radio(
                              value: 1,
                              groupValue: _options,
                              onChanged: ( value) {
                                setState(() {
                                  _options = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(translate('${key_}.option2')),
                            leading: Radio(
                              value: 2,
                              groupValue: _options,
                              onChanged: (value) {
                                setState(() {
                                  _options = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(translate('${key_}.option3')),
                            leading: Radio(
                              value: 3,
                              groupValue: _options,
                              onChanged: ( value) {

                                setState(() {
                                  _options = value!;
                                });
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              String answer_text = widget.answer == 0 ? translate('${key_}.option0') : widget.answer == 1 ? translate('${key_}.option1') : widget.answer == 2 ? translate('${key_}.option2') : translate('${key_}.option3');
                              if (widget.answer == _options) {
                                index++;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Congratulations(category:widget.category , collection_name:widget.collection_name , level: widget.level,)));
                              } else {
                                index++;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Fail(category:widget.category , collection_name:widget.collection_name , level: widget.level, answer: answer_text.toString(),)));
                              }
                            },
                            child: Container(
                              height: size.height * 0.05,
                              alignment: Alignment.center,
                              width: size.width * 0.4,
                              margin: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(23))),
                              child: Text(translate('360.btn'),
                                  style: TextStyle(fontSize: 15, color: Colors.white)),
                            ),
                          ),
                        ])
                      ]
                  )
              );
  }
}
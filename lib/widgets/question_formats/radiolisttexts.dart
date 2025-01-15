import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../style_.dart';
import '/widgets/question_formats/sucesspage.dart';

import '../../../values/app_icons.dart';
import 'failpage.dart';
import 'fetching_questions.dart';
import 'indexUpdate.dart';

class RadioListText extends StatefulWidget {
  const RadioListText(
      {Key? key,
      required this.option0,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.level,
      required this.collection_name,
      required this.category,
      required this.answer})
      : super(key: key);
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
    return _RadioListTextState();
  }
}

class _RadioListTextState extends State<RadioListText> {
  static String final_selected = "";
  int _options = -1;
  @override
  Widget build(BuildContext context) {
    String answer_text = widget.answer == 0 ? widget.option0 : widget.answer == 1 ? widget.option1 : widget.answer == 2 ? widget.option2 : widget.option3;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5.0),
      //height: size.height*0.3,
      width: size.width,
      child: Column(
        children: [
          ListTile(
            title: Text(widget.option0, style: TextStyle(fontWeight: FontWeight.w500, fontSize: content_size),),
            leading: Radio(
              value: 0,
              groupValue: _options,
              onChanged: ( value) {
                setState(() {
                  _options = value!;
                });
              },
            ),
            onTap: (){
              setState(() {
                _options = 0;
              });
            },
          ),
          ListTile(
            title: Text(widget.option1, style: TextStyle(fontWeight: FontWeight.w500, fontSize: content_size),),
            leading: Radio(
              value: 1,
              groupValue: _options,
              onChanged: ( value) {
                setState(() {
                  _options = value!;
                });
              },
            ),
            onTap: (){
              setState(() {
                _options = 1;
              });
            },
          ),
          ListTile(
            title: Text(widget.option2, style: TextStyle(fontWeight: FontWeight.w500, fontSize: content_size),),
            leading: Radio(
              value: 2,
              groupValue: _options,
              onChanged: (value) {
                setState(() {
                  _options = value!;

                });
              },
            ),
            onTap: (){
              setState(() {
                _options = 2;
              });
            },
          ),
          ListTile(
            title: Text(widget.option3, style: TextStyle(fontWeight: FontWeight.w500, fontSize: content_size),),
            leading: Radio(
              value: 3,
              groupValue: _options,
              onChanged: ( value) {
                setState(() {
                  _options = value!;
                });
              },
            ),
            onTap: (){
              setState(() {
                _options = 3;
              });
            },
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              if (widget.answer == _options) {
                index++;
                print("quiz data ${quizData}");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Congratulations(category: widget.category, level: widget.level, collection_name: widget.collection_name,)));
              } else {
                index++;
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Fail(answer: answer_text, category: widget.category, level: widget.level, collection_name: widget.collection_name)));
              }
            },
            child:
            Container(
              // height: size.height * 0.05,
              alignment: Alignment.center,
              width: size.width * 0.45,
              margin: const EdgeInsets.all(2.0),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(23))),
              child: Text("SUBMIT",
                  style: TextStyle(fontSize: button_size, color: Colors.white, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }
}

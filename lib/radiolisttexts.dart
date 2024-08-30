import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_care/widgets/sucesspage.dart';

import '../values/app_icons.dart';
import 'failpage.dart';



class RadioListText extends StatefulWidget {
  const RadioListText(
      {Key? key,
      required this.option0,
      required this.option1,
      required this.option2,
      required this.option3,
        required this.level,
      required this.answer})
      : super(key: key);
  final String option0;
  final String level;
  final String option1;
  final String option2;
  final String option3;
  final int answer;
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
    String answer_text= "option"+widget.answer.toString();
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5.0),
      //height: size.height*0.3,
      width: size.width,
      child: Column(
        children: [
          ListTile(
            title: Text(widget.option0),
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
            title: Text(widget.option1),
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
            title: Text(widget.option2),
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
            title: Text(widget.option3),
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
              if (widget.answer == _options) {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Congratulations(category: widget.level,)));
              } else {

                {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Fail(answer: answer_text,)));
                }
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
              child: Text("SUBMIT",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

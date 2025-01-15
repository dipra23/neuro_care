import 'package:cached_network_image/cached_network_image.dart';
import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/question_formats/sucesspage.dart';

import 'failpage.dart';
import '../../values/app_icons.dart';
import 'indexUpdate.dart';
class RadioList extends StatefulWidget {
  const RadioList({Key? key,required this.option0,required this.option1,
    required this.option2, required this.option3, required this.category, required this.answer,required this.level,required this.collection_name}) : super(key: key);
  final String option0;
  final String option1;
  final String option2;
  final String option3;
  final String category;
  final String level;
  final String collection_name;
  final int answer;

  @override
  State<StatefulWidget> createState() {
    return _RadioListState();
  }
}

class _RadioListState extends State<RadioList>{

  int _options = -1;
  @override
  Widget build(BuildContext context) {
    String answer_text = widget.answer == 0 ? widget.option0 : widget.answer == 1 ? widget.option1 : widget.answer == 2 ? widget.option2 : widget.option3;
    final size= MediaQuery.of(context).size;
    return Container(
      // height: size.height*0.7,
      width: size.width,
      child:SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    _options= 0;
                  });
                },
                child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: (_options == 0) ? Colors.green : Colors.black, width: (_options == 0) ? 4 : 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                              widget.option0, height: 100, width: 200,
                      ),
                  ),
              ),
                // leading: Radio(
                //   value: 0,
                //   groupValue: _options,
                //   onChanged:
                //       (value) {
                //     setState(() {
                //       _options= value!;
                //
                //     });
                //   },
                //
                // ),
                SizedBox(width: 20,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _options= 1;
                  });
                },
                child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: (_options == 1) ? Colors.green : Colors.black, width: (_options == 1) ? 4 : 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                      widget.option1, height: 100, width: 200,
                    ),
                  ),
              ),
                // leading: Radio(
                //   value: 1,
                //   groupValue: _options,
                //   onChanged:
                //       (value) {
                //     setState(() {
                //       _options= value!;
                //     });
                //   },
                // ),
              ]
            ),
            SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children : [
              GestureDetector(
                onTap: (){
                  setState(() {
                    _options= 2;
                  });
                },
                child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: (_options == 2) ? Colors.green : Colors.black, width: (_options == 2) ? 4 : 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                      widget.option2, fit: BoxFit.contain,
                    ),
                  ),
              ),
                // leading: Radio(
                //   value: 2,
                //   groupValue: _options,
                //   onChanged:
                //       (value) {
                //     setState(() {
                //       _options= value!;
                //     });
                //   },
                // ),
                  SizedBox(width: 20,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _options= 3;
                  });
                },
                child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: (_options == 3) ? Colors.green : Colors.black, width: (_options == 3) ? 4 : 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                      widget.option3, height: 100, width: 200,
                    ),
                  ),
              ),
                // leading: Radio(
                //   value: 3,
                //   groupValue: _options,
                //   onChanged:
                //       ( value) {
                //     setState(() {
                //       _options= value!;
                //     });
                //   },
                // ),
                ],
                ),
            SizedBox(height: 40),
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
              child: Container(
                // height: size.height * 0.05,
                alignment: Alignment.center,
                width: size.width * 0.45,
                padding: EdgeInsets.all(10),
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(23))),
                child: Text("SUBMIT",
                    style: TextStyle(fontSize: button_size, color: Colors.white, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),

    );


  }

  }







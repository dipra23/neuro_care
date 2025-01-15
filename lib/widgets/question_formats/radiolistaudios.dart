import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:string_capitalize/string_capitalize.dart';
import '/widgets/question_formats/sucesspage.dart';
import 'package:just_audio/just_audio.dart';
import 'failpage.dart';
import 'indexUpdate.dart';

class RadioListAudios extends StatefulWidget {
  const RadioListAudios(
      {Key? key,
        required this.option0,
        required this.option1,
        required this.option2,
        required this.option3,
        required this.level,
        required this.category,
        required this.collection_name,
        required this.answer})
      : super(key: key);
  final String option0;
  final String option1;
  final String level;
  final String option2;
  final String option3;
  final String category;
  final String collection_name;
  final int answer;
  @override
  State<StatefulWidget> createState() {
    return _RadioListAudiosState();
  }
}

class _RadioListAudiosState extends State<RadioListAudios> {
  static String final_selected = "";
  int _options = -1;
  final player= AudioPlayer();

  @override
  Future<void> dispose () async {
    // await player.stop();
    await player.dispose();
    super.dispose();
  }

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
            title: Text(translate('common_sounds.sound_1').toString().capitalize(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: content_size),),
            leading: Radio(
              value: 0,
              groupValue: _options,
              onChanged: ( value) async {
                final duration = await player.setUrl(widget.option0);
                setState(()  {
                  _options = value!; // Schemes: (https: | file: | asset: )
                  player.play();
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
            title:  Text(translate('common_sounds.sound_2').toString().capitalize(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: content_size),),
            leading: Radio(
              value: 1,
              groupValue: _options,
              onChanged: ( value) async {
                final duration = await player.setUrl(widget.option1);
                setState(()  {
                  _options = value!;
                  player.play();
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
            title: Text(translate('common_sounds.sound_3').toString().capitalize(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: content_size),),
            leading: Radio(
              value: 2,
              groupValue: _options,
              onChanged: (value) async {
                final duration = await player.setUrl(widget.option2);
                setState(()  {
                  _options = value!;
                  player.play();
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
            title:  Text(translate('common_sounds.sound_4').toString().capitalize(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: content_size),),
            leading: Radio(
              value: 3,
              groupValue: _options,
              onChanged: ( value) async {
                final duration = await player.setUrl(widget.option3);
                setState(()  {
                  _options = value!;
                  player.play();
                });
              },
            ),
            onTap: (){
              setState(() {
                _options = 3;
              });
            },
          ),
          SizedBox(height: 50,),
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
              height: size.height * 0.05,
              alignment: Alignment.center,
              width: size.width * 0.45,
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(23))),
              child: Text("SUBMIT",
                  style: TextStyle(fontSize: button_size, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

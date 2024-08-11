import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_care/widgets/audioplayer/question_audio_caller.dart';
import 'package:neuro_care/widgets/sucesspage.dart';
import 'package:just_audio/just_audio.dart';
import '../values/app_icons.dart';
import 'failpage.dart';



class RadioListAudios extends StatefulWidget {
  const RadioListAudios(
      {Key? key,
        required this.option0,
        required this.option1,
        required this.option2,
        required this.option3,
        required this.answer})
      : super(key: key);
  final String option0;
  final String option1;
  final String option2;
  final String option3;
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

    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5.0),
      //height: size.height*0.3,
      width: size.width,
      child: Column(
        children: [
          ListTile(
            title: Text("Click for audio 1"),
            leading: Radio(
              value: 0,
              groupValue: _options,
              onChanged: ( value) async {
                final duration = await player.setUrl(           // Load a URL
                    widget.option0);
                setState(()  {
                  _options = value!;
                                  // Schemes: (https: | file: | asset: )
                  player.play();


                });
              },
            ),
          ),
          ListTile(
            title:  Text("Click for audio 2"),
            leading: Radio(
              value: 1,
              groupValue: _options,
              onChanged: ( value) async {
                final duration = await player.setUrl(           // Load a URL
                    widget.option1);
                setState(()  {
                  _options = value!;
                  player.play();


                });


              },
            ),
          ),
          ListTile(
            title: Text("Click for audio 3"),
            leading: Radio(
              value: 2,
              groupValue: _options,
              onChanged: (value) async {
                final duration = await player.setUrl(           // Load a URL
                    widget.option2);
                setState(()  {
                  _options = value!;
                  player.play();
                });


              },
            ),
          ),
          ListTile(
            title:  Text("Click for audio 4"),
            leading: Radio(
              value: 3,
              groupValue: _options,
              onChanged: ( value) async {
                final duration = await player.setUrl(           // Load a URL
                    widget.option3);


                setState(()  {
                  _options = value!;
                  player.play();



                });


              },
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.answer == _options) {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Congratulations()));
              } else {

                {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Fail()));
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

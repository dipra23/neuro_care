import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/values/PuzzleImages.dart';
import 'package:neuro_care/widgets/videoplayer/videoplayer.dart';
import 'package:neuro_care/values/meditation_audios.dart';


import '../../values/app_icons.dart';
import 'meditation_audioplayer.dart';

class AudioCaller extends StatefulWidget{
  AudioCaller({Key? key, required this.title, required this.image_url, required this.audio_url}) : super(key: key);
  final String title;
  final String image_url;
  final String audio_url;
  @override
  State<StatefulWidget> createState() {
    return _AudioCallerState();
  }

}

class _AudioCallerState extends State<AudioCaller>{
//   List MeditationNames = [ "AUTUMN SKY", "BOAT", "HARP RELAX", "NATURE", "NATURE AND PIANO", "PIANO",
//   "SCOTTISH RAIN", "SPRIIT IN THE WOODS", "STARING AT THE NIGHT SKY", "STARLIGHT", "VALLEY SUNSET", "WHISPERING WINDS"];
//   List<String> MeditationAudios= [Meditation_Audios.AUTUMN_SKY, Meditation_Audios.BOAT, Meditation_Audios.HARP_RELAX,
//     Meditation_Audios.NATURE, Meditation_Audios.NATURE_AND_PIANO, Meditation_Audios.PIANO,
//     Meditation_Audios.SCOTTISH_RAIN, Meditation_Audios.SPIRIT_IN_THE_WOODS, Meditation_Audios.STARING_AT_THE_NIGHT_SKY,
//     Meditation_Audios.STARLIGHT, Meditation_Audios.VALLEY_SUNSET, Meditation_Audios.WHISPERING_WINDS];
// List MeditationImages = [Meditation_Images.AUTUMNSKY, Meditation_Images.BOAT, Meditation_Images.HARP,
//   Meditation_Images.NATURE,  Meditation_Images.NATUREPIANO,  Meditation_Images.PIANO,
//   Meditation_Images.RAIN,  Meditation_Images.WOODS,  Meditation_Images.NIGHTSKY,
//   Meditation_Images.STARLIGHT,  Meditation_Images.VALLEYSUNSET,  Meditation_Images.WHISPERINGWINDS];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Shader textGradient = LinearGradient(
      colors: [Colors.green, Colors.blue],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 60.0));
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFD0D1FF),
          title: Text(widget.title, textAlign: TextAlign.center,),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
            icon: SvgPicture.asset(AppIcons.LEFTARROW,
            ),


          )

      ),
      body: Column(
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              height: size.height*0.2,
              //color: Colors.yellow,
              width: size.width,
              margin:EdgeInsets.fromLTRB(5, 0, 5, 5) ,


              child: Text("Close your eyes, and relax",style: TextStyle(
                foreground: Paint()..shader = textGradient,overflow: TextOverflow.visible,

                fontSize: 32,
              ),),
            ),

          ),
          Container(
            child: Image.network(widget.image_url,
            height: size.height*0.4, width: size.width),
            height: size.height*0.4,
            width: size.width,
          ),

          Container(
            width: size.width*0.8,
            margin: EdgeInsets.fromLTRB(5, 30, 5, 5),
            height: size.height*0.2,
            child: MeditationPlayer(audio_url: widget.audio_url,),
          )







        ],
      ),
    );
  }

}
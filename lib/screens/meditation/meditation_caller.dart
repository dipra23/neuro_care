import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../style_.dart';

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

class _AudioCallerState extends State<AudioCaller> with TickerProviderStateMixin{
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

  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);
  late final CurvedAnimation _animation = CurvedAnimation(
    parent: _controller,
    curve:  Curves.easeIn,
    reverseCurve: Curves.easeOut
  );

  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              alignment: Alignment.center,
              // height: size.height*0.2,
              //color: Colors.yellow,
              width: size.width,
              margin:EdgeInsets.fromLTRB(5, 0, 5, 5) ,
              child: Text(translate('meditate.meditate_instruction'),style: TextStyle(
                fontSize: appbar_size+2, fontWeight: FontWeight.w700
              ),
                textAlign: TextAlign.center,),
            ),
          ),
          SizedBox(height: 20),
          Image.asset("assets/m_d.gif", width: 200,),
          SizedBox(height: 50,),
          FadeTransition(
            opacity: _animation,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(translate('meditate.meditate_breathe'), style: TextStyle(fontSize: appbar_size, fontWeight: FontWeight.w700),),
            ),
          ),
          SizedBox(height: 30,),
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
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/values/PuzzleImages.dart';
import 'package:neuro_care/widgets/audioplayer/audiocaller.dart';

import '../../values/app_icons.dart';
import '../../values/meditation_audios.dart';

class ChooseMeditation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChooseMeditationState();
  }

}


class _ChooseMeditationState extends State<ChooseMeditation>{
  List MeditationNames = [ "AUTUMN SKY", "BOAT", "HARP RELAX", "NATURE", "NATURE AND PIANO", "PIANO",
    "SCOTTISH RAIN", "SPRIIT IN THE WOODS", "NIGHT SKY", "STARLIGHT", "VALLEY SUNSET", "WHISPERING WINDS"];
  List<String> MeditationAudios= [Meditation_Audios.AUTUMN_SKY, Meditation_Audios.BOAT, Meditation_Audios.HARP_RELAX,
    Meditation_Audios.NATURE, Meditation_Audios.NATURE_AND_PIANO, Meditation_Audios.PIANO,
    Meditation_Audios.SCOTTISH_RAIN, Meditation_Audios.SPIRIT_IN_THE_WOODS, Meditation_Audios.STARING_AT_THE_NIGHT_SKY,
    Meditation_Audios.STARLIGHT, Meditation_Audios.VALLEY_SUNSET, Meditation_Audios.WHISPERING_WINDS];
  List MeditationImages = [Meditation_Images.AUTUMNSKY, Meditation_Images.BOAT, Meditation_Images.HARP,
    Meditation_Images.NATURE,  Meditation_Images.NATUREPIANO,  Meditation_Images.PIANO,
    Meditation_Images.RAIN,  Meditation_Images.WOODS,  Meditation_Images.NIGHTSKY,
    Meditation_Images.STARLIGHT,  Meditation_Images.VALLEYSUNSET,  Meditation_Images.WHISPERINGWINDS];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
List<Widget> Tiles= [];

     myRow() {
      for (int i = 0; i < MeditationNames.length; i++) {
        Tiles.insert(i,  GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AudioCaller(index: i,)),
            );
          },
            child: GridTile(

                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      //color: Colors.pink,

                    ),
                    margin: const EdgeInsets.all(5.0),
                    child: Column(
                        children: [
                          Image.asset(
                              MeditationImages[i],
                              height: size.height*0.05,
                             ),
                          Spacer(),
                          Text(MeditationNames[i],
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(1.1),),

                        ]

                    )

                )
            )
        )
        );

      }
      return Tiles;

    }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0XFFF5DEDE),
            title: Text("MEDITATION", textAlign: TextAlign.center,),
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
        body:Center(
          child: GridView.count(
                          crossAxisCount: 3,
              children: <Widget>[...myRow()]





                      )
                    ),

          );



  }

}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/widgets/videoplayer/videoplayer.dart';

import '../../values/app_icons.dart';

class VideoPlayer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerState();
  }

}

class _VideoPlayerState extends State<VideoPlayer>{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Shader textGradient = LinearGradient(
      colors: [Colors.green, Colors.blue],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 60.0));
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFD0D1FF),
          title: Text("SCENARIOS", textAlign: TextAlign.center,),
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
              height: size.height*0.1,
              //color: Colors.yellow,
              width: size.width,
              margin:EdgeInsets.fromLTRB(5, 50, 5, 40) ,


              child: Text("Watch the following videos",style: TextStyle(
                foreground: Paint()..shader = textGradient,overflow: TextOverflow.visible,

                fontSize: 32,
              ),),
            ),

          ),
          Center(
            child: Container(

               height: size.height*0.3,
               width: size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:[ Container(
                  width: size.width,
                  child: AspectRatio(
                      aspectRatio:16.0/9.0,
                      child: DefaultPlayer(video: "assets/videos/video.MOV",))
                ),
                  Container(
                      width: size.width,

                      child: AspectRatio(
                          aspectRatio:16.0/9.0,
                          child: DefaultPlayer(video: "assets/videos/video.MOV"))
                  ),
                  Container(
                      width: size.width,

                      child: AspectRatio(
                          aspectRatio:16.0/9.0,
                          child: DefaultPlayer(video: "assets/videos/video.MOV"))
                  ),
                  ]
              ),
            ),
          ),
          Center(
            child: Container(
              margin:EdgeInsets.fromLTRB(5, 50, 5, 40) ,
              //color: Colors.red,
              height: size.height*0.1,
              width: size.width*0.8,
              child: Text("Ready to test your knowledge?", style:TextStyle(
              foreground: Paint()..shader = textGradient,overflow: TextOverflow.visible,

              fontSize: 32,
              )
              )
              ,)
              ,
            )
              ,

          GestureDetector(
            onTap: (){},
            child: Container(
              height: size.height*0.05,
              alignment: Alignment.center,
              width: size.width*0.4,

              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(23))

              ),
              child: Text("Click here!", style: TextStyle(fontSize: 15,color: Colors.white)),

            ),
          ),


        ],
      ),
    );
  }

}
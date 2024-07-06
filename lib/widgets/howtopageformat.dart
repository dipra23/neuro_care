import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/values/PuzzleImages.dart';

import '../radiolisttexts.dart';
import '../values/app_icons.dart';
import 'identification.dart';

class HowToPages extends StatefulWidget{
   HowToPages({Key? key, required this.label}) : super(key: key);
   String label;
  @override
  State<StatefulWidget> createState() {
    return _HowToPagesState();
  }

}
class _HowToPagesState extends State<HowToPages> {
  @override
  Widget build(BuildContext context) {
    final Shader textGradient = LinearGradient(
      colors: [Colors.green, Colors.blue],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 60.0));
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFF5DEDE),
          title: Text(widget.label, textAlign: TextAlign.center,),
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
           Container(
             height: size.height*0.05,
             margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
             child: Text("IN 5 SIMPLE STEPS...",style: TextStyle(
               foreground: Paint()..shader = textGradient,overflow: TextOverflow.visible,

               fontSize: 32,
             ),)
           ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    child: Image.asset(PuzzleImages.MOUNTAIN),
                    height: size.height*0.8,
                    width: size.width
                  ),
                  Container(
                    child: Image.asset(PuzzleImages.MOUNTAIN),
                    height: size.height*0.8,
                    width: size.width,
                  ),
                  Container(
                    child: Image.asset(PuzzleImages.MOUNTAIN),
                    height: size.height*0.8,
                    width: size.width,
                  ),
                  Container(
                    child: Image.asset(PuzzleImages.MOUNTAIN),
                    height: size.height*0.8,
                    width: size.width,
                  ),
                  Container(
                    child: Image.asset(PuzzleImages.MOUNTAIN),
                    height: size.height*0.8,
                    width: size.width,
                  )
                ],
              )
            )




          ]

      ),

    );
  }
}


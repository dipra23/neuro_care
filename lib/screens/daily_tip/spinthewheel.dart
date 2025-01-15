import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../style_.dart';
import '/homepage/homepage.dart';
import  '/screens/games/puzzle/jigsaw_puzzle.dart';

import '../../homepage/bottomnavigation.dart';
import '../../values/app_icons.dart';
import '../../values/global_variables.dart';

class Wheel extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WheelState();
  }
}

class _WheelState extends State<Wheel>{
  StreamController<int> controller = StreamController<int>();
  int? outcome;

  // List<String> dailytooltipimages= [ AppIcons.FAMILYMEMBERS, AppIcons.SMILE, AppIcons.COLOURINGBOOK,
  // AppIcons.PLANT, AppIcons.BOOK, AppIcons.PHONE,  AppIcons.LOCATION, AppIcons.SOUNDS, AppIcons.HOWTO, AppIcons.FAMILYTREE];
  List<dynamic> dailytooltipimages = [Icons.family_restroom_sharp, FontAwesomeIcons.solidSmile, FontAwesomeIcons.paintBrush, FontAwesomeIcons.seedling,
              FontAwesomeIcons.book, Icons.phone, FontAwesomeIcons.puzzlePiece, FontAwesomeIcons.music, FontAwesomeIcons.photoVideo, Icons.nature_people];
  // "Play a card game",
  // "List three things you are grateful for", "Thank 3 people", "Write a thank you note for someone",
  // "Have dinner with a family member", "Sing a song from your childhood",Ask a family member about their day"
  // "Clean something", "Call a friend", "Go for walk"
List<FortuneItem> _WheelItems(){
  int color;

  List<FortuneItem> FortuneItems= [];
for (int i= 0; i<dailytooltipimages.length; i++){
if (i%2==0){
  color= 0XFFFD0D1FF;
}
else{
  color=0XFFFD9A6DA;
}
  FortuneItems.insert(i, FortuneItem(
      style: FortuneItemStyle(
        color: Color(color),
        borderWidth: 3, // <-- custom circle slice stroke width
      ),
  child: RotatedBox(quarterTurns: 4,
  child: Container(height: 30, alignment: Alignment.center, padding: EdgeInsets.only(left: 20),
      child: Icon(dailytooltipimages[i], size: 32, color: Colors.black,)))
  ));
}
return FortuneItems;
}

  Future<void> _showMyDialog() async {
  print("OUTCOME : ${outcome}");
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text("${translate("daily_tool_tip.result.outcome.${(outcome!+1).toString()}",)}", textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.w500),),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(translate("daily_tool_tip.result.msg"), textAlign: TextAlign.center, style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              alignment: Alignment.center,
              child:
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  BottomNavigationExample()));
                },
                child: Text(translate("daily_tool_tip.result.dismiss"), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700, color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFF5DEDE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  minimumSize: const Size(130, 40),
                  // textStyle: TextStyle(fontSize: 14),
                  shadowColor: Color(0XFFF5DEDE),
                  elevation: 5,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose(){
    super.dispose();
    controller.close();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFD0D1FF),
          title: Text(translate("daily_tool_tip.title"), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: appbar_size),),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: SvgPicture.asset(AppIcons.LEFTARROW,
          ),
        ),
      ),
      body:Column(
      children:[
        Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
       child: Container(
         height: size.height*0.6,
         padding: const EdgeInsets.all(10.0),
         margin: const EdgeInsets.all(20.0),
         child: FortuneWheel(
           selected: controller.stream,
           animateFirst: false,
            hapticImpact: HapticImpact.medium,
            indicators: const [
              FortuneIndicator(
                alignment: Alignment.topCenter,
                  child: TriangleIndicator(
                    color: Colors.black,
                    width: 30,
                    height: 40,
                    elevation: 10,
                  ),
              )
            ]
            ,
            items: [
             ..._WheelItems()
            ],
           onAnimationEnd: (){
             print("done");
             _showMyDialog();
           }),
          ),
       ),

        GestureDetector(
          onTap: () {
            setState(() {
              outcome= Fortune.randomInt(1, 11);
              print(outcome);
              controller.add(outcome!);
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: size.width*0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0XFFF5DEDE),
            ),
            child: Center(
              child: Text(translate("daily_tool_tip.btn"), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w800),),
            ),
          ),
        ),
      ]
    )
    );
  }


}

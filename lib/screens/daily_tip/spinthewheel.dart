import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/homepage/homepage.dart';
import 'package:neuro_care/screens/games/puzzle/jigsaw_puzzle.dart';

import '../../homepage/bottomnavigation.dart';
import '../../values/app_icons.dart';


class Wheel extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WheelState();
  }

}


class _WheelState extends State<Wheel>{
  StreamController<int> controller = StreamController<int>();
  int? outcome;

  List<String> dailytooltips = ["Say hello to a family member", "Ask a family member about their day"
  , "smile at someone today", "Draw something and show it to a loved one", "Go for a walk "
  , "Water plants", "Sit on a bench or a swing", "Listen to your favourite music",
  "Look at photo albums", "Read a book", "Play a card game",
  "List three things you are grateful for", "Thank 3 people", "Write a thank you note for someone",
  "Have dinner with a family member", "Sing a song from your childhood",
  "Clean something", "Call a friend"];

List<FortuneItem> _WheelItems(){
  int color;

  List<FortuneItem> FortuneItems= [];
for (int i= 0; i<dailytooltips.length; i++){
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
  child: Text(dailytooltips[i])
  ));


}
return FortuneItems;

}
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(dailytooltips[outcome!]),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Enjoy your activity! See you tomorrow!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Exit to home'),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  BottomNavigationExample()));
                });
              },
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
          backgroundColor: Color(0XFFF5DEDE),
          title: Text("DAILY TOOL TIP", textAlign: TextAlign.center,),
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
      body:Column(
      children:[ Material(
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
              outcome= Fortune.randomInt(0, dailytooltips.length);
              controller.add(outcome!);

            });
          },
          child: Container(
            height:size.height*0.1,
            width: size.width*0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Color(0XFFF5DEDE),

          ),
            child: Center(
              child: Text("SPIN TO GET ONE"),
            ),
          ),
        ),

      ]
    )

    );
  }


}

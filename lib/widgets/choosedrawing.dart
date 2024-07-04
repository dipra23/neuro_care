import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../values/app_icons.dart';

class ChooseDrawing extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChooseDrawingState();
  }

}
class _ChooseDrawingState extends State<ChooseDrawing>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Column( children: [Text("CHOOSE SOMETHING TO COLOR  ", softWrap: true,),])
),
        body:

        Center(
          child:
              GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                DrawingContainer(width: 187, height: 240, label: "Flowers", color: 0XFFFF5DEDE),
                DrawingContainer(width: 161, height: 188, label: "Traffic Light", color: 0XFFFD0D1FF),
                DrawingContainer(width: 187, height: 190, label: "Sun", color: 0XFFFF0F1F9),
                DrawingContainer(width: 182, height: 193, label: "Tree", color: 0XFFFC9EBED),
                DrawingContainer(width: 187, height: 148, label: "Clouds", color: 0XFFF99D7DB),
                DrawingContainer(width: 187, height: 243, label: "Mountains", color: 0XFFFEEC1C1),





              ],


            )


        )
    );

  }

}

class DrawingContainer extends StatelessWidget {
  const DrawingContainer({Key? key, required this.width , required this.height, required this.label, required this.color}) : super(key: key);
  final double width;
  final double height;
  final String label;
  final int color;
  //final String appicons;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
        child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Color(color),

            ),
            margin: const EdgeInsets.all(20.0),

            child: Column(
                children: [
                  SvgPicture.asset(AppIcons.LOCATION, height: 70, width: 10),
                  Text(label, textAlign: TextAlign.center,textScaler: TextScaler.linear(1.1),),

                ]
            )));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../radiolisttexts.dart';
import '../values/app_icons.dart';
class QuestionFormatTwo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _QuestionFormatTwoState();
  }

}

class _QuestionFormatTwoState extends State<QuestionFormatTwo>{
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFC9EBED),
          title: Text("Locations", textAlign: TextAlign.center,),
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
      body:
    Column(
    children: [
    Container(
    height: size.height*0.2,
    alignment: Alignment.center,
    padding: EdgeInsets.all(25),
    child:Text("What is this?",
    style: TextStyle(fontSize: 25),
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center),
    ),
    Container(
      margin: const EdgeInsets.all(20.0),
      child: SvgPicture.asset(AppIcons.LOCATION,
        width: 100,
          height: 100,),
      ),
      RadioListText()




    ]
    ));
  }
}
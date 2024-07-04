import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_care/widgets/radiolistimages.dart';

import '../values/app_icons.dart';

class QuestionFormatOne extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _QuestionFormatOneState();
  }

}
class _QuestionFormatOneState extends State<QuestionFormatOne>{
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
      body: Column(
        children: [
          Container(
            height: size.height*0.3,
            width: size.width*0.75,
            alignment: Alignment.center,
            padding: EdgeInsets.all(25),
            child:Text("Which of the following is the .......?",
            style: TextStyle(fontSize: 25),
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center),
          ),
          Container(
            child: RadioList(

            ),
          )
        ],


      ),
    );
  }

}

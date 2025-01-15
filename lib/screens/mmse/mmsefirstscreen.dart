import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '/screens/mmse/mmsequestionsscreen.dart';

import '../../values/app_icons.dart';

class MMSEfirst extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MMSEfirstState();
  }
}

class _MMSEfirstState extends State<MMSEfirst>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0XFFFD0D1FF),
     body: Center(
       child: Column(
         children: [
           SizedBox(height: 170,),
           Container(
             width: 300,
             child: Image.asset(AppIcons.MMSE_ICON),
           ),
           Container(
             padding: EdgeInsets.all(20),
             margin: EdgeInsets.all(20),
             child: Text(
               translate('mmse.instruction'),
               style: TextStyle(fontSize: title_size),
               textAlign: TextAlign.center,
             ),
           ),
           ElevatedButton(
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => mmse_questions()));
             },
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
               child: Text(
                 translate('mmse.btn'),
                 style: TextStyle(fontSize: title_size, fontWeight: FontWeight.w700, color: Colors.black),
               ),
             )
           )
         ],
       ),
     ),
   );
  }
}
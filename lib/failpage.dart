import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fail extends StatefulWidget{
  const Fail({Key? key, required this.answer}) : super(key: key);
final String answer;
  @override
  State<StatefulWidget> createState() {
    return _FailState();
  }

}

class _FailState extends State<Fail>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:

        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.fromLTRB(20, 150, 20, 20),

                  child:Column(
                    children: [
                      Text("Sorry the answer was: ${widget.answer}", textScaler: TextScaler.linear(1.5),),
                      Text("Try another one!",textScaler: TextScaler.linear(1.5)),

                    ],
                  ),

                ),

                Container(
                  height: 40,
                  width: 200,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(20.0),
                  child:Text("TAP TO CONTINUE"),
                  decoration: BoxDecoration(
                      color: Color(0XFFFF5DEDE),
                      borderRadius: BorderRadius.all(Radius.circular(23))
                  ),



                ),
              ]
          ),
        )
    );
  }

}
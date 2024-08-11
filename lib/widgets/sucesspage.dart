import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Congratulations extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CongratulationsState();
  }

}

class _CongratulationsState extends State<Congratulations>{
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
                  Text("Congratulations! ", textScaler: TextScaler.linear(1.5),),
                  Text("You solved it! ",textScaler: TextScaler.linear(1.5)),

                ],
              ),
          
            ),
              Container(
                child:Text("+ 5 POINTS"),
                height: 40,
                width: 200,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Color(0XFFFF5DEDE),
                      borderRadius: BorderRadius.all(Radius.circular(23))
                  ),),
                 GestureDetector(
                   onTap: (){
                     //Question_AnswersState.index = index+ 1;
                     setState(() {

                     });
                   },
                   child: Container(
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
                 ),
                ]
          ),
        )
    );
  }

}
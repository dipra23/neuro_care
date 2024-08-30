import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphite/graphite.dart';
import 'package:neuro_care/fetching_colouringbook.dart';
import 'package:neuro_care/screens/daily_tip/spinthewheel.dart';
import 'package:neuro_care/screens/games/drawing_book/drawing_book.dart';
import 'package:neuro_care/widgets/fetching_questions.dart';
import 'package:neuro_care/widgets/howto.dart';
import 'package:neuro_care/screens/identification/identification.dart';
import 'package:neuro_care/widgets/videoplayer/videocaller.dart';

import '../screens/games/puzzle/puzzle_firestore.dart';
import '../screens/meditation/meditation_firestore.dart';
import '../values/app_icons.dart';

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFD0D1FF),
          title: Text("NEUROCARE", textAlign: TextAlign.center,),
          centerTitle: true,
          leading: IconButton(onPressed: () {

          },
            icon: SvgPicture.asset(AppIcons.NEUROCARE
            )


          )

      ),
      body:  Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(

              children:[
                      Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                          height: size.height*0.1,
                          width: size.width*0.8,
                          child: Text("Welcome back .....",  style: TextStyle(fontSize: 24)),
                          ),
                      Container(
                    
                          decoration: BoxDecoration(


                                borderRadius: BorderRadius.all(Radius.circular(23)),


                            color: Color(0XFFFEEC1C1),


                    
                          ),
                          height: size.height*0.25,
                          width: size.width*0.8,
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(15.0),
                    
                          child:Column(
                          children: [
                            Text("Daily Tool Tip", style: TextStyle(fontSize: 18),),
                            Spacer(),
                            Text("Take a moment to enjoy a simple activity that connects you with the world around you. Spend quality time with yourself or your loved ones!"),
                            Spacer(),
                            Container(
                            height: size.height*0.05,
                              alignment: Alignment.center,
                              width: size.width*0.4,
                            decoration: BoxDecoration(
                              color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(23))

                            ),
                            child: GestureDetector(
    onTap: (){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Wheel()));},
                                child: Text("Click here to get one!", style: TextStyle(fontSize: 14, color: Colors.white))))
                          ],
                        )
                      ),
                    
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(top: 20),
                        height: size.height*0.1,
                        width: size.width*0.8,
                        child: Text("Identification",  style: TextStyle(fontSize: 22)),
                      ),
                      Row(
                        children: [
                          Container(
                            width: size.width*0.267,
                            height: size.height*0.25,
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Color(0XFFFC9EBED),
                              borderRadius: BorderRadius.all(Radius.circular(23)),
                            ),
                            child: Column(
                              children: [
                              Container(
                                child: SvgPicture.asset(AppIcons.LOCATION),
                                  ),
                                Spacer(),
                                Container(
                                  child: Text("LOCATIONS"),
                                ),
                                Spacer(),
                                GestureDetector(
                                  child: Container(
                                      height: size.height*0.05,
                                      alignment: Alignment.center,
                                      width: size.width*0.22,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(14))
                    
                                      ),
                                      child: Text("PLAY!", style: TextStyle(fontSize: 12,color: Colors.black))),
                                )
                                ]
                          )),
                          Spacer(),
                          Container(
                              width: size.width*0.267,
                              height: size.height*0.25,
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Color(0XFFFC9EBED),
                                borderRadius: BorderRadius.all(Radius.circular(23)),

                              ),
                              child: Column(
                                  children: [
                                    Container(
                                      child: SvgPicture.asset(AppIcons.FAMILYMEMBERS),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text("FAMILY MEMBERS"),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      child: Container(
                                          height: size.height*0.05,
                                          alignment: Alignment.center,
                                          width: size.width*0.22,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(14))
                    
                                          ),
                                          child: Text("PLAY!", style: TextStyle(fontSize: 12,color: Colors.black))),
                                    )
                                  ]
                              )),
                          Spacer(),
                          Container(
                              width: size.width*0.267,
                              height: size.height*0.25,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              decoration: BoxDecoration(
                                color: Color(0XFFFC9EBED),
                                borderRadius: BorderRadius.all(Radius.circular(23)),
                              ),
                              child: Column(
                                  children: [
                                    Container(
                                      child: SvgPicture.asset(AppIcons.DAILYOBJECTS),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text("DAILY OBJECTS"),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      child: Container(
                                          height: size.height*0.05,
                                          alignment: Alignment.center,
                                          width: size.width*0.22,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(14))
                    
                                          ),
                                          child: Text("PLAY!", style: TextStyle(fontSize: 12,color: Colors.black))),
                                    )
                    
                                  ]
                              ))
                    
                        ],
                      ),
                      GestureDetector(
                        onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Identification()),
                        );},
                        child: Container(
                          height: size.height*0.05,
                          alignment: Alignment.center,
                          width: size.width*0.4,
                          margin: const EdgeInsets.all(6.0),
                    
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(23))
                    
                          ),
                          child: Text("Click to view all", style: TextStyle(fontSize: 15,color: Colors.white)),
                    
                        ),
                      ),
                      // Spacer(),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(top: 20),
                        height: size.height*0.1,
                        width: size.width*0.8,
                        child: Text("Learn Something",  style: TextStyle(fontSize: 22)),
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: ()
              {
              {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HowTo()),
              );
              }
              },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),

                            height: size.height*0.15,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(23)),
                              color: Color(0XFFFEEC1C1),

                            ),
                            child: Column(
                              children: [
                                SvgPicture.asset(AppIcons.HOWTO),
                              Spacer(),
                              Text("HOW TO...? DAILY ACTIVITIES"),
                                                 ] )),
                        ),
                        Spacer(),

                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),

                          height: size.height*0.15,
                          width: size.width*0.4,
                          decoration: BoxDecoration(
                            color: Color(0XFFFEEC1C1),
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(AppIcons.FAMILYTREE),
                            Spacer(),
                            Text("YOUR FAMILY TREE"),
                        ])),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showDialog(context: context,
                                builder: (ctx) =>
                                    AlertDialog(
                                        title: const Text("Difficulty Level"),
                                        content: const Text("please select a difficulty level"),
                                        actions: <Widget> [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "languages_easy", category: "languages", level: 'easy',)));

                                              }, child: Container(
                                            color: Colors.green,
                                            padding: const EdgeInsets.all(14),
                                            child: const Text("Easy"),

                                          )
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "languages_intermediate", category: "languages", level: 'intermediate',)));

                                              }, child: Container(
                                            color: Colors.green,
                                            padding: const EdgeInsets.all(14),
                                            child: const Text("Intermediate"),

                                          )
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "languages_hard", category: "lamguages", level: 'hard',)));

                                              }, child: Container(
                                            color: Colors.green,
                                            padding: const EdgeInsets.all(14),
                                            child: const Text("Hard"),

                                          )
                                          ),

                                        ]
                                    )
                            );

                          },
                          // onTap: ()
                          // {
                          //   {Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => question_answers(collection_name: "languages_easy", category: "easy", level: 'easy',)),
                          //   );
                          //   }
                          // },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.all(15.0),
                            height: size.height*0.15,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                              color: Color(0XFFFEEC1C1),
                              borderRadius: BorderRadius.all(Radius.circular(23)),
                          
                          
                            ),
                            child: Column(
                              children: [SvgPicture.asset(AppIcons.LANGUAGES),Spacer(),Text("LANGUAGES"),
                           ] )
                          
                          ),
                        ),
Spacer(),
                        GestureDetector(
                          onTap: ()
                        {
                        {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VideoPlayer()),
                        );
                        }
                        },
                          child: Container(
                              alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.all(15.0),
                            height: size.height*.15,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                              color: Color(0XFFFEEC1C1),
                              borderRadius: BorderRadius.all(Radius.circular(23)),


                            ),
                            child: Column(
                              children: [
                                SvgPicture.asset(AppIcons.SCENARIOBASED),
                                Spacer(),
                                Text("SCENARIO-BASED"),
                           ] )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(top: 20),
                  height: size.height*0.1,
                  width: size.width*0.8,
                  child: Text("Games",  style: TextStyle(fontSize: 22)),
                ),
                  GestureDetector(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Puzzle_Selection()),
                    );},
                    child: Container(
                        width: size.width*0.85,
                        height: size.height*0.15,
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0XFFFC9EBED),
                          borderRadius: BorderRadius.all(Radius.circular(23)),

                        ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.PUZZLES),
                          Text("PUZZLES"),
                        ],
                      ),
                                    ),
                  ),
                GestureDetector(
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColouringBookEasy()
                       // Drawing_Book()
                    ));},
                  child: Container(
                      width: size.width*0.85,
                      height: size.height*0.15,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color(0XFFFC9EBED),
                        borderRadius: BorderRadius.all(Radius.circular(23)),
                      ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.COLOURINGBOOK),
                        Text("DRAWING BOOK"),
                      ],
                    ),
                  ),
                ),
                Container(

                    decoration: BoxDecoration(
                      color: Color(0XFFFEEC1C1),
                      borderRadius: BorderRadius.all(Radius.circular(23)),


                    ),
                    height: size.height*0.25,
                    width: size.width*0.8,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(top: 40),

                    child: Column(
                      children: [
                        Text("MEDITATION", style: TextStyle(fontSize: 18),),
                        Spacer(),
                        Text("Take a moment to engage in a peaceful meditation. Connect with your inner self and find tranquility in the present moment."),
                        Spacer(),
                        Container(
                            height: size.height*0.05,
                            alignment: Alignment.center,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(23))

                            ),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Meditation_Selection()),
                                  );
                                },

                                child: Text("Click here to begin", style: TextStyle(fontSize: 14, color: Colors.white))))
                      ],
                    )
                ),

                    
                    
                    ],
                  ),
          ),
        ),
      ),




    );
  }
}
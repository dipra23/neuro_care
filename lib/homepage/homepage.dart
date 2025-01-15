import 'package:dipra/screens/family_members/addFamilyMembers.dart';
import 'package:dipra/style_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:graphite/graphite.dart';
import '../screens/family_members/familyMembers.dart';
import '../screens/games/games.dart';
import '../screens/games/maze/maze.dart';
import '../screens/games/memory_flip/memory_flip.dart';
import '../screens/mmse/mmsefirstscreen.dart';
import '/fetching_colouringbook.dart';
import '/screens/daily_tip/spinthewheel.dart';
import '/screens/games/drawing_book/drawing_book.dart';
import '/widgets/question_formats/fetching_questions.dart';
import '/widgets/howto.dart';
import '/screens/identification/identification.dart';
import '/widgets/videoplayer/videocaller.dart';

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

  final List<Map<String, dynamic>> GameData = [
    {
      'image': "assets/jigsaw.png",
      'name': translate('home.games.1'),
      'color' : const Color(0xFFBDB0E1),
    },
    {
      'image': "assets/maze.png",
      'name': translate('home.games.2'),
      'color' : const Color(0xFFF1D5D5),
    },
    {
      'image': "assets/card-game.png",
      'name': translate('home.games.3'),
      'color' : const Color(0xFFCEEAFF),
    },
    {
      'image': "assets/sketchbook.png",
      'name': translate('home.games.4'),
      'color' : const Color(0xFFFFF4BD),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFD0D1FF),
          title: Text(translate('home.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: appbar_size),),
          centerTitle: true,
          leading: Row(
            children: [
              SizedBox(width : 7),
              Image.asset("assets/neurocare.png", width : 45,),
            ],
          ),
      ),
      body:  Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children:[
                    //   Container(
                    // alignment: Alignment.center,
                    // padding: const EdgeInsets.all(10.0),
                    //       height: size.height*0.1,
                    //       width: size.width*0.8,
                    //       child: Text("Welcome back .....",  style: TextStyle(fontSize: 24)),
                    //       ),
                      SizedBox(height: 20,),
                      // Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(23)),
                      //       color: Color(0XFFFEEC1C1),
                      //     ),
                      //     height: size.height*0.26,
                      //     width: size.width*0.85,
                      //     padding: const EdgeInsets.all(12.0),
                      //     margin: const EdgeInsets.all(15.0),
                      //     child:Column(
                      //     children: [
                      //       Text(translate('home.daily_tool_tip.title'), style: TextStyle(fontSize: title_size,fontWeight: FontWeight.w700)),
                      //       Spacer(),
                      //       Text(translate('home.daily_tool_tip.paragraph'),
                      //       style: TextStyle(fontSize: para_size),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //       Spacer(),
                      //       Container(
                      //         alignment: Alignment.center,
                      //         width: size.width*0.62,
                      //       decoration: BoxDecoration(
                      //         color: Colors.black,
                      //           borderRadius: BorderRadius.all(Radius.circular(23))
                      //       ),
                      //       child: GestureDetector(
                      //           onTap: (){Navigator.push(
                      //           context,
                      //           MaterialPageRoute(builder: (context) => Wheel()));},
                      //           child: Container(
                      //               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      //               child: Text(translate('home.daily_tool_tip.btn'), style: TextStyle(fontSize: button_size, color: Colors.white, fontWeight: FontWeight.w700))))),
                      //       SizedBox(height: 2,)
                      //     ],
                      //   )
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFEEC1C1),
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                        ),
                        // height: size.height*0.26,
                        width: size.width*0.85,
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/fortune-wheel.png",height: 100,width: 100,),
                            SizedBox(width: 10,),
                            Flexible(
                              child: Column(
                                children: [
                                  Text(translate('home.daily_tool_tip.title'), style: TextStyle(fontSize: title_size, fontWeight: FontWeight.w700),),
                                  SizedBox(height: 10,),
                                  Text(translate('home.daily_tool_tip.paragraph'),
                                    textAlign: TextAlign.center, style: TextStyle(fontSize: para_size),),
                                  SizedBox(height: 15,),
                                  ElevatedButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Wheel()));
                                    },
                                    child: Text(translate('home.daily_tool_tip.btn'), style: TextStyle(fontSize: button_size, color: Colors.white, fontWeight: FontWeight.w700)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      minimumSize: const Size(150, 40),
                                      // shadowColor: Colors.grey,
                                      elevation: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        // margin: const EdgeInsets.only(top:10),
                        height: size.height*0.1,
                        width: size.width*0.8,
                        child: Text(translate('home.identification.title'),  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width*0.277,
                            height: size.height*0.25,
                              // margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Color(0XFFFC9EBED),
                              borderRadius: BorderRadius.all(Radius.circular(23)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Container(
                                // child: SvgPicture.asset(AppIcons.LOCATION, width: 70, height: 70,),
                                child : Image.asset("assets/icons_imgs/location.png", width : 70, height : 70),
                                  ),
                                Spacer(),
                                Container(
                                  child: Text(translate('home.identification.1'), textAlign: TextAlign.center, style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w700),),
                                ),
                                SizedBox(height: 20,),
                                GestureDetector(
                                  onTap: (){
                                    showDialog(context: context,
                                        builder: (ctx) =>
                                            AlertDialog(
                                                title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
                                                content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                                                actions: <Widget> [
                                                  Center(
                                                    child: Column(
                                                      children: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "locations_easy", category: "LOCATIONS", level: 'easy',)));

                                                            }, child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                                            color: Color(0XFFFEEC1C1),
                                                          ),
                                                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                          child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),

                                                        )
                                                        ),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "locations_intermediate", category: "LOCATIONS", level: 'intermediate',)));

                                                            }, child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                                            color: Color(0XFFFEEC1C1),

                                                          ),
                                                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                          child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize:  button_size, fontWeight: FontWeight.w700)),

                                                        )
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "locations_hard", category: "LOCATIONS", level: 'hard',)));
                                                          }, child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                color: Color(0XFFFEEC1C1)
                                                            ),
                                                            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                            child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize:  button_size, fontWeight: FontWeight.w700),
                                                            )
                                                        ),
                                                        )],
                                                    ),
                                                  ),
                                                ]
                                            )
                                        );
                                    },
                                  child: Container(
                                      height: size.height*0.05,
                                      alignment: Alignment.center,
                                      width: size.width*0.22,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(14))
                                      ),
                                      child: Text(translate('home.identification.play_btn'), style: TextStyle(fontSize: button_size,color: Colors.black, fontWeight: FontWeight.w700))),
                                )
                                ]
                          )),
                          SizedBox(width: 20,),
                          Container(
                              width: size.width*0.277,
                              height: size.height*0.25,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10.0),
                              // margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              decoration: BoxDecoration(
                                color: Color(0XFFFC9EBED),
                                borderRadius: BorderRadius.all(Radius.circular(23)),
                              ),
                              child: Column(
                                  children: [
                                    Container(
                                      // child: SvgPicture.asset(AppIcons.DAILYOBJECTS, width: 70, height: 70,),
                                      child : Image.asset("assets/icons_imgs/daily_objects.png", width : 70, height : 70),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(translate('home.identification.3'), textAlign: TextAlign.center, style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w700),),
                                    ),
                                    SizedBox(height: 20,),
                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context,
                                            builder: (ctx) =>
                                                AlertDialog(
                                                    title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
                                                    content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                                                    actions: <Widget> [
                                                      Center(
                                                        child: Column(
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "daily_object_easy", category: "DAILY OBJECTS", level: 'easy',)));

                                                                }, child: Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                color: Color(0XFFFEEC1C1),

                                                              ),
                                                              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                              child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),

                                                            )
                                                            ),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "daily_object_intermediate", category: "DAILY OBJECTS", level: 'intermediate',)));

                                                                }, child: Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                color: Color(0XFFFEEC1C1),

                                                              ),
                                                              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                              child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),

                                                            )
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "daily_object_hard", category: "DAILY OBJECTS", level: 'hard',)));
                                                              }, child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                    color: Color(0XFFFEEC1C1)
                                                                ),
                                                                padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                                child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700),
                                                                )
                                                            ),
                                                            )],
                                                        ),
                                                      ),

                                                    ]
                                                )
                                        );
                                      },
                                      child: Container(
                                          height: size.height*0.05,
                                          alignment: Alignment.center,
                                          width: size.width*0.22,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(14))

                                          ),
                                          child: Text(translate('home.identification.play_btn'), style: TextStyle(fontSize: button_size,color: Colors.black, fontWeight: FontWeight.w700))),
                                    )

                                  ]
                              )),
                          SizedBox(width: 20,),
                          Container(
                              width: size.width*0.277,
                              height: size.height*0.25,
                              // margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Color(0XFFFC9EBED),
                                borderRadius: BorderRadius.all(Radius.circular(23)),

                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      // child: SvgPicture.asset(AppIcons.SOUNDS, width: 70, height: 70,),
                                      child : Image.asset("assets/icons_imgs/sound.png", width : 70, height : 70),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Text(translate('home.identification.2'), textAlign: TextAlign.center, style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w700),),
                                    ),
                                    SizedBox(height: 20,),
                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context,
                                            builder: (ctx) =>
                                                AlertDialog(
                                                    title: Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700) ),
                                                    content: Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                                                    actions: <Widget> [
                                                      Center(
                                                        child: Column(
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "common_sounds_easy", category: "SOUNDS", level: 'easy',)));

                                                                }, child: Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                color: Color(0XFFFEEC1C1),

                                                              ),
                                                              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                              child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),

                                                            )
                                                            ),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "common_sounds_intermediate", category: "SOUNDS", level: 'intermediate',)));

                                                                }, child: Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                color: Color(0XFFFEEC1C1),

                                                              ),
                                                              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                              child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),

                                                            )
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "common_sounds_hard", category: "SOUNDS", level: 'hard',)));
                                                              }, child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                    color: Color(0XFFFEEC1C1)
                                                                ),
                                                                padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                                child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700),
                                                                )
                                                            ),
                                                            )
                                                          ],
                                                        ),
                                                      ),

                                                    ]
                                                )
                                        );
                                      },
                                      child: Container(
                                          height: size.height*0.05,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(14))

                                          ),
                                          child: Text(translate('home.identification.play_btn'), style: TextStyle(fontSize: button_size,color: Colors.black, fontWeight: FontWeight.w700))),
                                    )
                                  ]
                              )),
                        ],
                      ),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Identification()),
                        );},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(23))

                          ),
                          child: Text(translate('home.identification.btn'), style: TextStyle(fontSize: button_size,color: Colors.white, fontWeight: FontWeight.w700)),

                        ),
                      ),
                      // Spacer(),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.only(top: 10),
                        height: size.height*0.1,
                        width: size.width*0.8,
                        child: Text(translate('home.learn.title'),  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HowTo()),
                            );
                            },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            // margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                            height: size.height*0.17,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(23)),
                              color: Color(0XFFFEEC1C1),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(AppIcons.HOWTO, width: 60, height: 60,),
                                Image.asset("assets/icons_imgs/how_to.png", width : 60, height : 60),
                                SizedBox(height: 10,),
                              Text(translate('home.learn.1'), textAlign: TextAlign.center, style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w700),),
                                                 ] )),
                        ),
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => FamilyTreePage()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            height: size.height*0.17,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                              color: Color(0XFFFEEC1C1),
                              borderRadius: BorderRadius.all(Radius.circular(23)),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(AppIcons.FAMILYTREE, width: 60, height: 60,),
                                Image.asset("assets/icons_imgs/family-tree.png", width : 60, height : 60),
                                SizedBox(height: 10,),
                              Text(translate('home.learn.2'), textAlign: TextAlign.center, style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w700),),
                          ])),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            showDialog(context: context,
                                builder: (ctx) =>
                                    AlertDialog(
                                        title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
                                        content: Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w700 ), textAlign: TextAlign.center,),
                                        actions: <Widget> [
                                          Center(
                                            child: Column(

                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "languages_easy", category: "languages", level: 'easy',)));
                                                    }, child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                                    color: Color(0XFFFEEC1C1),

                                                  ),
                                                  // width: 150,
                                                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                  child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),

                                                )
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "languages_intermediate", category: "languages", level: 'intermediate',)));

                                                    }, child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                                    color: Color(0XFFFEEC1C1),

                                                  ),
                                                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                  child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),

                                                )
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "languages_hard", category: "languages", level: 'hard',)));

                                                  }, child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                                        color: Color(0XFFFEEC1C1)
                                                    ),

                                                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                                    child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700),
                                                      textAlign: TextAlign.center,
                                                    )
                                                ),
                                                )],
                                            ),
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
                            // margin: const EdgeInsets.all(15.0),
                            height: size.height*0.16,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                              color: Color(0XFFFEEC1C1),
                              borderRadius: BorderRadius.all(Radius.circular(23)),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(AppIcons.LANGUAGES, width: 60, height: 60,),
                                Image.asset("assets/icons_imgs/language.png", width : 60, height : 60),
                                SizedBox(height: 10,),
                                Text(translate('home.learn.3'), textAlign: TextAlign.center, style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w700),),
                           ] )
                          
                          ),
                        ),
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: ()
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MMSEfirst()),
                          );
                        },
                          child: Container(
                              alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            // margin: const EdgeInsets.all(15.0),
                            height: size.height*.16,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                              color: Color(0XFFFEEC1C1),
                              borderRadius: BorderRadius.all(Radius.circular(23)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(AppIcons.SCENARIOBASED, width: 60, height: 60,),
                                Image.asset("assets/icons_imgs/test.png", width : 60, height : 60),
                                SizedBox(height: 10,),
                                Text(translate('home.learn.4'), textAlign: TextAlign.center, style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w700),),
                           ]
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.only(top: 10),
                  height: size.height*0.1,
                  width: size.width*0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(translate('home.games.title'),  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Games()));
                        },
                        child: Text(translate('home.games.view_all'),  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 , shadows: [
                          Shadow(
                              color: Colors.grey,
                              offset: Offset(0, -5))
                        ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey,
                          decorationThickness: 2,
                        )),
                      )
                    ],
                  ),
                ),
                //   GestureDetector(
                //     onTap: (){
                //       Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Puzzle_Selection()),
                //     );
                //       },
                //     child: Container(
                //         width: size.width*0.85,
                //         // height: size.height*0.15,
                //         margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                //         alignment: Alignment.center,
                //         padding: const EdgeInsets.all(15.0),
                //         decoration: BoxDecoration(
                //           color: Color(0XFFFC9EBED),
                //           borderRadius: BorderRadius.all(Radius.circular(23)),
                //
                //         ),
                //       child: Row(
                //         children: [
                //           SvgPicture.asset(AppIcons.PUZZLES, width: 70, height: 70,),
                //           SizedBox(width: 10,),
                //           Text(translate('home.games.1'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                //         ],
                //       ),
                //                     ),
                //   ),
                // GestureDetector(
                //   onTap: (){
                //     showDialog(context: context,
                //       builder: (ctx) =>
                //         AlertDialog(
                //           title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center,),
                //           content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: 16),),
                //           actions: <Widget> [
                //             Center(
                //               child: Column(
                //                 children: [
                //                   TextButton(
                //                       onPressed: () {
                //                         Navigator.push(context,MaterialPageRoute(builder: (context) => MazeGame(level: 'easy',)));
                //
                //                       }, child: Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.all(Radius.circular(12)),
                //                       color: Color(0XFFFEEC1C1),
                //
                //                     ),
                //                     padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                //                     child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: 18)),
                //
                //                   )
                //                   ),
                //                   TextButton(
                //                       onPressed: () {
                //                         Navigator.push(context,MaterialPageRoute(builder: (context) => MazeGame(level: 'intermediate',)));
                //
                //                       }, child: Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.all(Radius.circular(12)),
                //                       color: Color(0XFFFEEC1C1),
                //
                //                     ),
                //                     padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                //                     child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: 18)),
                //
                //                   )
                //                   ),
                //                   TextButton(
                //                     onPressed: () {
                //                       Navigator.push(context,MaterialPageRoute(builder: (context) => MazeGame(level: 'hard',)));
                //                     }, child: Container(
                //                       decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.all(Radius.circular(12)),
                //                           color: Color(0XFFFEEC1C1)
                //                       ),
                //                       padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                //                       child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: 18),
                //                       )
                //                   ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //
                //           ]
                //         )
                //     );
                //   },
                //   child: Container(
                //     width: size.width*0.85,
                //     // height: size.height*0.15,
                //     margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.all(15.0),
                //     decoration: BoxDecoration(
                //       color: Color(0XFFFC9EBED),
                //       borderRadius: BorderRadius.all(Radius.circular(23)),
                //     ),
                //     child: Row(
                //       children: [
                //         SvgPicture.asset(AppIcons.COLOURINGBOOK, width: 70, height: 70,),
                //         SizedBox(width: 10,),
                //         Text(translate('home.games.2'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                //       ],
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: (){
                //     showDialog(context: context,
                //         builder: (ctx) =>
                //             AlertDialog(
                //                 title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center,),
                //                 content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: 16),),
                //                 actions: <Widget> [
                //                   Center(
                //                     child: Column(
                //                       children: [
                //                         TextButton(
                //                             onPressed: () {
                //                               Navigator.push(context,MaterialPageRoute(builder: (context) => MemoryFlip(level: 'easy',)));
                //
                //                             }, child: Container(
                //                           decoration: BoxDecoration(
                //                             borderRadius: BorderRadius.all(Radius.circular(12)),
                //                             color: Color(0XFFFEEC1C1),
                //
                //                           ),
                //                           padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                //                           child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: 18)),
                //
                //                         )
                //                         ),
                //                         TextButton(
                //                             onPressed: () {
                //                               Navigator.push(context,MaterialPageRoute(builder: (context) => MemoryFlip(level: 'intermediate',)));
                //
                //                             }, child: Container(
                //                           decoration: BoxDecoration(
                //                             borderRadius: BorderRadius.all(Radius.circular(12)),
                //                             color: Color(0XFFFEEC1C1),
                //
                //                           ),
                //                           padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                //                           child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: 18)),
                //
                //                         )
                //                         ),
                //                         TextButton(
                //                           onPressed: () {
                //                             Navigator.push(context,MaterialPageRoute(builder: (context) => MemoryFlip(level: 'hard',)));
                //                           }, child: Container(
                //                             decoration: BoxDecoration(
                //                                 borderRadius: BorderRadius.all(Radius.circular(12)),
                //                                 color: Color(0XFFFEEC1C1)
                //                             ),
                //                             padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                //                             child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: 18),
                //                             )
                //                         ),
                //                         )],
                //                     ),
                //                   ),
                //
                //                 ]
                //             )
                //     );
                //     },
                //   child: Container(
                //     width: size.width*0.85,
                //     // height: size.height*0.15,
                //     margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.all(15.0),
                //     decoration: BoxDecoration(
                //       color: Color(0XFFFC9EBED),
                //       borderRadius: BorderRadius.all(Radius.circular(23)),
                //     ),
                //     child: Row(
                //       children: [
                //         SvgPicture.asset(AppIcons.COLOURINGBOOK, width: 70, height: 70,),
                //         SizedBox(width: 10,),
                //         Text(translate('home.games.3'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                //       ],
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: (){Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => ColouringBookEasy()
                //        // Drawing_Book()
                //     ));},
                //   child: Container(
                //       width: size.width*0.85,
                //       // height: size.height*0.15,
                //       margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                //       alignment: Alignment.center,
                //       padding: const EdgeInsets.all(15.0),
                //       decoration: BoxDecoration(
                //         color: Color(0XFFFC9EBED),
                //         borderRadius: BorderRadius.all(Radius.circular(23)),
                //       ),
                //     child: Row(
                //       children: [
                //         SvgPicture.asset(AppIcons.COLOURINGBOOK, width: 70, height: 70,),
                //         SizedBox(width: 10,),
                //         Text(translate('home.games.4'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                //       ],
                //     ),
                //   ),
                // ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child : Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: GameData.map<Widget>((entry){
                          return GameTitle(
                            image: entry["image"],
                            name: entry["name"],
                            color: entry["color"],
                          );
                        }).toList(),
                      ),
                    )
                ),
                // Container(
                //     decoration: BoxDecoration(
                //       color: Color(0XFFFEEC1C1),
                //       borderRadius: BorderRadius.all(Radius.circular(23)),
                //     ),
                //     height: size.height*0.26,
                //     width: size.width*0.85,
                //     padding: const EdgeInsets.all(10.0),
                //     margin: const EdgeInsets.only(top: 40),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text(translate('home.meditation.title'), style: TextStyle(fontSize: title_size, fontWeight: FontWeight.w700),),
                //         SizedBox(height: 15,),
                //         Text(translate('home.meditation.paragraph'),
                //           textAlign: TextAlign.center, style: TextStyle(fontSize: para_size),),
                //         SizedBox(height: 15,),
                //         Container(
                //             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                //             alignment: Alignment.center,
                //             decoration: BoxDecoration(
                //                 color: Colors.black,
                //                 borderRadius: BorderRadius.all(Radius.circular(23))
                //             ),
                //             margin: const EdgeInsets.symmetric(horizontal: 10),
                //             child: GestureDetector(
                //                 onTap: (){
                //                   Navigator.push(
                //                     context,
                //                     MaterialPageRoute(builder: (context) => Meditation_Selection()),
                //                   );
                //                 },
                //
                //                 child: Text(translate('home.meditation.btn'), style: TextStyle(fontSize: button_size, color: Colors.white, fontWeight: FontWeight.w700)))),
                //         SizedBox(height: 2,)
                //       ],
                //     )
                // ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFFEEC1C1),
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                  ),
                  // height: size.height*0.26,
                  width: size.width*0.85,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/meditation.png",height: 100,width: 100,),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Column(
                          children: [
                            Text(translate('home.meditation.paragraph'), textAlign: TextAlign.center, style: TextStyle(fontSize: para_size),),
                            SizedBox(height: 15,),
                            ElevatedButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Meditation_Selection()),
                                );
                              },
                              child: Text(translate('home.meditation.btn'), style: TextStyle(fontSize: button_size, color: Colors.white, fontWeight: FontWeight.w700)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                minimumSize: const Size(150, 40),
                                elevation: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GameTitle extends StatelessWidget {
  final String image;
  final String name;
  final Color color;

  const GameTitle({super.key,
    required this.image,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> Pages = {"Puzzle": Jigsaw_Start_Page(points: points,), "Match The Following" : MatchColumn2(points: points,) , "Quiz": QuizScreen(points: points,), "Story Mode": ScenarioStartScreen()};
    return GestureDetector(
      onTap: () {
        if(image.contains("maze.png")){
          maze_game(context);
        }
        else if(image.contains("sketchbook.png")){
          drawing_book(context);
        }
        else if(image.contains("jigsaw.png")){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Puzzle_Selection()),
          );
        }
        else{
          memory_game(context);
        }
      },
      child :
      Container(
          margin: const EdgeInsets.only(left: 20, bottom: 20),
          padding: const EdgeInsets.all(0),
          width: 130,
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0XFFFC9EBED),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2, color: Colors.grey.withOpacity(0.35)),
            boxShadow: [
              BoxShadow(
                color: Color(0XFFFC9EBED).withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    // color: color,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  ),
                  child: Image.asset(image, width: 70, height: 70,)
                // child : SvgPicture.asset(image, width: 70, height: 70,),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20,),
            ],
          )
      ),
    );
  }

  Future memory_game(BuildContext context){
    return showDialog(context: context,
      builder: (ctx) =>
          AlertDialog(
              title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center,),
              content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
              actions: <Widget> [
                Center(
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => MemoryFlip(level: 'easy',)));

                          }, child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0XFFFEEC1C1),

                        ),
                        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                        child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: 18)),

                      )
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => MemoryFlip(level: 'intermediate',)));

                          }, child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0XFFFEEC1C1),

                        ),
                        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                        child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: 18)),

                      )
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => MemoryFlip(level: 'hard',)));
                        }, child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Color(0XFFFEEC1C1)
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: 18),
                          )
                      ),
                      )],
                  ),
                ),

              ]
      )
    );
  }

  Future maze_game(BuildContext context){
    return showDialog(context: context,
      builder: (ctx) =>
        AlertDialog(
          title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center,),
          content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
          actions: <Widget> [
            Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => MazeGame(level: 'easy',)));

                      }, child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0XFFFEEC1C1),

                    ),
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                    child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: 18)),

                  )
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => MazeGame(level: 'intermediate',)));

                      }, child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0XFFFEEC1C1),

                    ),
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                    child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: 18)),

                  )
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => MazeGame(level: 'hard',)));
                    }, child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0XFFFEEC1C1)
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                      child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: 18),
                      )
                  ),
                  )
                ],
              ),
            ),

          ]
        )
    );
  }

  Future drawing_book(BuildContext context){
    return showDialog(context: context,
        builder: (ctx) =>
            AlertDialog(
                title:  Text(translate('home.identification.dialog.title'), textAlign: TextAlign.center,),
                content:  Text(translate('home.identification.dialog.subtitle'), style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                actions: <Widget> [
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ColouringBookEasy(level: 'easy', collection_name: "drawings_easy",)));

                            }, child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0XFFFEEC1C1),

                          ),
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child:  Text(translate('home.identification.dialog.easy'), style: TextStyle(fontSize: 18)),

                        )
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ColouringBookEasy(level: 'intermediate', collection_name: "drawings_intermediate",)));

                            }, child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0XFFFEEC1C1),

                          ),
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child:  Text(translate('home.identification.dialog.intermediate'),  style: TextStyle(fontSize: 18)),

                        )
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ColouringBookEasy(level: 'hard', collection_name: "drawings_hard",)));
                          }, child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                color: Color(0XFFFEEC1C1)
                            ),
                            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                            child:  Text(translate('home.identification.dialog.hard'),  style: TextStyle(fontSize: 18),
                            )
                        ),
                        )
                      ],
                    ),
                  ),

                ]
            )
    );
  }
}
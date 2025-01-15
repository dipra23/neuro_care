import 'package:dipra/screens/meditation/meditation_instruction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../auth/user_model.dart';
import '../../auth/user_repository.dart';
import '../../style_.dart';
import '../../widgets/question_formats/indexUpdate.dart';
import '/screens/games/drawing_book/drawing_book.dart';
import '/values/app_icons.dart';
import '/screens/meditation/meditation_caller.dart';
final FirebaseFirestore firestore= FirebaseFirestore.instance;


class Meditation_Selection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Meditation_SelectionState ();
  }
}

class Meditation_SelectionState  extends State<Meditation_Selection>{

  late List data;
  late Map current_document;
  static int index= 0;
  List<Widget> Tiles= [];

  final userRepo = UserRepository();
  void updatePoints(Points_Update_Model user, String? uid){
    userRepo.updatePoints(user, uid);
  }
  User? user_ = FirebaseAuth.instance.currentUser;

  Future<Map> GetData () async {
    final collection = firestore.collection("meditation");
    QuerySnapshot all_collections= await collection.get();
    List doc_list = all_collections.docs.map((doc) => doc.data()).toList();
    data = doc_list;

    current_document= data[index];
    return current_document;
  }
  // @override
  // void initState(){
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     GetData().then((value) {
  //       // data = data;
  //       current_document= data[index];
  //     });
  //   });
  // }
  myRow() {
    for (int i = 0; i < data.length; i++) {
      index= i;
      current_document= data[index];
      Tiles.insert(i,  GestureDetector(
          onTap: (){
            meditation++;
            final user= Points_Update_Model(
                total_points: total_points,
                meditation: meditation,
                hard_puzzles: hard_puzzles,
                quizzes: quizzes,
                locations_360: locations_360,
                drawings: drawings,
                puzzle_number: puzzle_number,
                sounds: sounds,
                languages: languages,
                current_points: current_points);
            updatePoints(user, user_?.uid);

            index= i;
            current_document= data[index];
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MeditationInstructions(title: current_document["title"], image_url: current_document["image_url"], audio_url: current_document["audio_url"]
                )
                )
                );

          },
          child: GridTile(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: const EdgeInsets.all(0),
                width: 170,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0XFFF5DEDE),
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(width: 2, color: Colors.grey.withOpacity(0.35)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0XFFFD0D1FF).withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                    children: [
                      Container(
                        height: 150,
                        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Color(0XFFFD0D1FF),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                          child: Image.network(
                            current_document["image_url"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Expanded(
                        child: Text(
                          current_document["title"].toString().replaceAll("_", " "),
                          style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w700),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Text(current_document["title"].toString().replaceAll("_", " "),style: TextStyle(fontWeight:FontWeight.w900, fontSize: button_size ),
                      //   textAlign: TextAlign.center,),

                    ]
                )
            ),
          )
      )
      );

    }
    return Tiles;

  }
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFF5DEDE),
          title: Text(translate('meditate.main_title'), textAlign: TextAlign.center,),
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
      body: FutureBuilder(
        builder: (ctx, snapshot){
          if(snapshot.hasData){

            return Container(
              padding: EdgeInsets.all(20),
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 1.1),
                    mainAxisSpacing: 15,
                    children: <Widget>[...myRow()]
                )
            );}

          else if(snapshot.hasError){
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
          return CircularProgressIndicator();
        }, future: GetData(),
      ),
    );
  }
}







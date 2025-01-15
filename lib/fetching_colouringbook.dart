import 'package:dipra/style_.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '/screens/games/drawing_book/drawing_book.dart';
import '/values/app_icons.dart';
import '/screens/meditation/meditation_caller.dart';
import 'auth/user_model.dart';
import 'auth/user_repository.dart';
import 'widgets/question_formats/indexUpdate.dart';
final FirebaseFirestore firestore= FirebaseFirestore.instance;


class ColouringBookEasy extends StatefulWidget{

  const ColouringBookEasy({Key? key, required this.collection_name, required this.level}) : super(key: key);
  final String level;
  final String collection_name;

  @override
  State<StatefulWidget> createState() {
    return ColouringBookEasyState ();
  }

}

class ColouringBookEasyState  extends State<ColouringBookEasy>{

  late List data;
  late List easy_data;
  late List intermediate_data;
  late List hard_data;
  late Map easy_current_document;
  late Map intermediate_current_document;
  late Map hard_current_document;


  List<Widget> Tiles= [];

  final userRepo = UserRepository();
  void updatePoints(Points_Update_Model user, String? uid){
    userRepo.updatePoints(user, uid);
  }
  User? user_ = FirebaseAuth.instance.currentUser;

  Future<Map> GetData () async {


      final easy_collection = firestore.collection(widget.collection_name);
      QuerySnapshot all_easy_collections = await easy_collection.get();
      List doc_easy_list = all_easy_collections.docs.map((doc) => doc.data()).toList();
      easy_data = doc_easy_list;
      easy_current_document = easy_data[0];

     //  final intermediate_collection = firestore.collection("drawings_intermediate");
     //  QuerySnapshot all_intermediate_collections = await intermediate_collection.get();
     //  List doc_intermediate_list = all_intermediate_collections.docs.map((doc) => doc.data()).toList();
     //  intermediate_data = doc_intermediate_list;
     //  intermediate_current_document = easy_data[0];
     //
     //
     //  final hard_collection = firestore.collection("drawings_hard");
     //  QuerySnapshot all_hard_collections = await hard_collection.get();
     //  List doc_hard_list = all_hard_collections.docs.map((doc) => doc.data()).toList();
     // hard_data = doc_hard_list;
     //  hard_current_document = hard_data[0];

      return easy_current_document;

    }

  myRow(data)

  {
    for (int i = 0; i < data.length; i++) {

      Map current_document= data[i];
      Tiles.insert(i,  GestureDetector(
          onTap: (){
            drawings++;
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
            current_document= data[i];
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Drawing_Book(image_url: current_document["image_url"]),
                ));
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
                        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        padding: const EdgeInsets.all(0),
                        height: 145,
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
                      const SizedBox(height: 7,),
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
              // child: Container(
              //     alignment: Alignment.center,
              //     padding: const EdgeInsets.all(7.0),
              //     decoration: BoxDecoration(
              //       color: Color(0XFFF5DEDE),
              //       border: Border.all(color: Color(0XFFF5DEDE), width: 2),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Column(
              //         children: [
              //           Image.network(
              //             current_document["image_url"],
              //             height: 100,
              //             width: 120,
              //           ),
              //           SizedBox(height: 7,),
              //           Text(current_document["title"],
              //             textAlign: TextAlign.center,
              //             style: TextStyle(fontWeight: FontWeight.w700, fontSize: content_size),
              //             softWrap: true,
              //             overflow: TextOverflow.visible,
              //           ),
              //         ]
              //
              //     )
              //
              // )
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
          title: Text(translate('drawing.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700,)),
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
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 1.1),
                    mainAxisSpacing: 15,
                    children: <Widget>[...myRow(easy_data)]
                  ),
                )
              ),
            );
          }
      
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
      )

      )
    ;




  }
}











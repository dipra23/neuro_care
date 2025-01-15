import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '/screens/games/drawing_book/drawing_book.dart';
import '/screens/games/puzzle/jigsaw_puzzle.dart';
import '/values/app_icons.dart';
import '/screens/meditation/meditation_caller.dart';
final FirebaseFirestore firestore= FirebaseFirestore.instance;


class Puzzle_Selection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Puzzle_SelectionState ();
  }

}

class Puzzle_SelectionState  extends State<Puzzle_Selection>{
  late List data;
  late Map current_document;
  static int index= 0;
  List<Widget> Tiles= [];

  Future<Map> GetData () async {
    final collection = firestore.collection("puzzles");
    QuerySnapshot all_collections= await collection.get();
    List doc_list = all_collections.docs.map((doc) => doc.data()).toList();
    data = doc_list;

    current_document= data[index];
    return current_document;
  }

  myRow() {
    for (int i = 0; i < data.length; i++) {
      index= i;
      current_document= data[index];


      Tiles.insert(i,  GestureDetector(
          onTap: () {
            index = i;
            current_document = data[index];
            showDialog(
              context: context,
              builder: (ctx) =>
                  AlertDialog(
                      title:  Text(translate('identification.dialog.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
                      content:  Text(translate('identification.dialog.subtitle'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                      actions: <Widget>[
                        Center(
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          JigSawPuzzlePage(image_url: current_document["img_url"], gridsize: 3,)
                                      )
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      color: Color(0XFFFEEC1C1)
                                  ),
                                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                  child:  Text(translate('identification.dialog.easy'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          JigSawPuzzlePage(image_url: current_document["img_url"], gridsize: 4)
                                      )
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      color: Color(0XFFFEEC1C1)
                                  ),
                                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                  child: Text(translate('identification.dialog.intermediate'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          JigSawPuzzlePage(image_url: current_document["img_url"], gridsize: 5)
                                      )
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      color: Color(0XFFFEEC1C1)
                                  ),
                                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                  child:  Text(translate('identification.dialog.hard'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                  ),
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
                            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Color(0XFFFD0D1FF),
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                              child: Image.network(
                                current_document["img_url"],
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
          title: Text(translate('puzzles.db_title'), textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
            icon: SvgPicture.asset(AppIcons.LEFTARROW,
            ),
          ),
      ),
      body: FutureBuilder(
        builder: (ctx, snapshot){
          if(snapshot.hasData){
            print(snapshot);
            return Center(
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







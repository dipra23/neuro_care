import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/screens/games/drawing_book/drawing_book.dart';
import 'package:neuro_care/values/app_icons.dart';
import 'package:neuro_care/screens/meditation/meditation_caller.dart';
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
            index= i;
            current_document= data[index];
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AudioCaller(title: current_document["title"], image_url: current_document["image_url"], audio_url: current_document["audio_url"]
                )
                )
                );

          },
          child: GridTile(

              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    //color: Colors.pink,

                  ),
                  margin: const EdgeInsets.all(5.0),
                  child: Column(
                      children: [
                        Image.network(
                          current_document["image_url"],
                          height: 30,
                        ),
                        Spacer(),
                        Text(current_document["title"],
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.linear(1.1),),

                      ]

                  )

              )
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
          title: Text("MEDITATION", textAlign: TextAlign.center,),
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

            return Center(
                child: GridView.count(
                    crossAxisCount: 3,
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







import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/screens/games/drawing_book/drawing_book.dart';
import 'package:neuro_care/values/app_icons.dart';
import 'package:neuro_care/screens/meditation/meditation_caller.dart';
final FirebaseFirestore firestore= FirebaseFirestore.instance;


class ColouringBookEasy extends StatefulWidget{

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

  Future<Map> GetData () async {


      final easy_collection = firestore.collection("drawings_easy");
      QuerySnapshot all_easy_collections = await easy_collection.get();
      List doc_easy_list = all_easy_collections.docs.map((doc) => doc.data()).toList();
      easy_data = doc_easy_list;
      easy_current_document = easy_data[0];

      final intermediate_collection = firestore.collection("drawings_intermediate");
      QuerySnapshot all_intermediate_collections = await intermediate_collection.get();
      List doc_intermediate_list = all_intermediate_collections.docs.map((doc) => doc.data()).toList();
      intermediate_data = doc_intermediate_list;
      intermediate_current_document = easy_data[0];


      final hard_collection = firestore.collection("drawings_hard");
      QuerySnapshot all_hard_collections = await hard_collection.get();
      List doc_hard_list = all_hard_collections.docs.map((doc) => doc.data()).toList();
     hard_data = doc_hard_list;
      hard_current_document = hard_data[0];

      return easy_current_document;




    }

  myRow(data)

  {
    for (int i = 0; i < data.length; i++) {

      Map current_document= data[i];
      Tiles.insert(i,  GestureDetector(
          onTap: (){

            current_document= data[i];
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Drawing_Book(image_url: current_document["image_url"]),
                ));
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
          title: Text("DRAWING BOOK", textAlign: TextAlign.center,),
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
      body: SingleChildScrollView(

        child: FutureBuilder(
          builder: (ctx, snapshot){
            if(snapshot.hasData){
              return Container(

                child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          color: Colors.red,
                          child: Text("Easy"),
                        ),
                        GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                            crossAxisCount: 3,
                            children: <Widget>[...myRow(easy_data)]


                        ),
                        Container(
                          height: 20,
                          color: Colors.red,
                          child: Text("Intermediate"),
                        ),
                        GridView.count(
                            physics: NeverScrollableScrollPhysics(),

                            shrinkWrap: true,
                            crossAxisCount: 3,
                            children: <Widget>[...myRow(intermediate_data)]


                        ),
                        Container(
                          height: 20,
                          color: Colors.red,
                          child: Text("Hard"),
                        ),
                        GridView.count(
                            physics: NeverScrollableScrollPhysics(),

                            shrinkWrap: true,
                            crossAxisCount: 3,
                            children: <Widget>[...myRow(hard_data)]


                        ),

                      ],
                    )
                ),
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



        )

      )
    ;




  }
}











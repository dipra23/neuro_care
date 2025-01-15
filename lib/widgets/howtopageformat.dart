import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/values/PuzzleImages.dart';

import '../fetching_colouringbook.dart';
import '../values/app_icons.dart';
import '../screens/identification/identification.dart';

class HowToPages extends StatefulWidget{
   HowToPages({Key? key, required this.document_name}) : super(key: key);
   String document_name;
  @override
  State<StatefulWidget> createState() {
    return _HowToPagesState();
  }

}
class _HowToPagesState extends State<HowToPages> {
  Map<String, dynamic> data = {};
  late Map current_map;
  List<Widget> Steps = [];

  @override
  void initState() {
    super.initState();
    // GetData();

  }

  Future<void> GetData() async {
    final document = firestore.collection("how_to").doc(widget.document_name);
    document.get().then((value) {
        data = value.data()!;
        print(data);
    });
  }

   ExtractData() async {
     print("something ${widget.document_name}");
    for (int i = 0; i < data.length; i++) {
      Steps.insert(i,Column(
        children: [
          Container(
              child: Image.network(data[i]["image"]),
              height: 100,
              width: 100
          ),
          Container(
            child: Text(data[i]["step"]),
          )
        ],
      ),);
    }

    return Steps;
  }

  @override
  Widget build(BuildContext context) {
    final Shader textGradient = LinearGradient(
      colors: [Colors.green, Colors.blue],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 60.0));
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0XFFF5DEDE),
            title: Text(widget.document_name, textAlign: TextAlign.center,),
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
        body: Column(

            children: [
              Container(
                  height: size.height * 0.05,
                  margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  child: Text("IN SIMPLE STEPS...", style: TextStyle(
                    foreground: Paint()
                      ..shader = textGradient, overflow: TextOverflow.visible,
                    fontSize: 20,
                  ),)
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:FutureBuilder(
                    future: GetData(),
                    builder: (ctx, snapshot){
                      print("dgfshjdgs");
                      if(snapshot.connectionState == ConnectionState.done) {
                        print("fsdhgvdhjbdf");
                        print("snapshot $snapshot");
                        if (snapshot.hasData) {
                          print("in");
                          return GridView.count(crossAxisCount: 10,
                            children: <Widget>[...ExtractData()],)
                          ;
                        }

                        else if (snapshot.hasError) {
                          print("error");
                          return Center(
                            child: Text(
                              '${snapshot.error} occurred',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }
                        else{
                          print("some error");
                        }
                      }
                      print("error123");
                      return CircularProgressIndicator();

                    },
                  )

                  // FutureBuilder(future: ExtractData(),
                  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //       if (snapshot.data == null) {
                  //         return CircularProgressIndicator();
                  //       } else {
                  //         return Row(
                  //           children: ,
                  //         );
                  //       }
                  //     }))
              )]));
  }


}

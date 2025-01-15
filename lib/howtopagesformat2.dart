import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '/values/PuzzleImages.dart';

import '../fetching_colouringbook.dart';
import '../values/app_icons.dart';
import '../screens/identification/identification.dart';

class HowToPages2 extends StatefulWidget{
  HowToPages2({Key? key, required this.document_name}) : super(key: key);
  String document_name;
  @override
  State<StatefulWidget> createState() {
    return _HowToPages2State();
  }

}
class _HowToPages2State extends State<HowToPages2> {
  late Map<String, dynamic> data;
  late Map current_map;
  List<Widget> Steps = [];

  @override
  void initState() {
    super.initState();
    // GetData();
  }


  Future<Map> GetData() async {
    final document = await firestore.collection("how_to").doc(widget.document_name);

    await document.get().then((value) {
      data = value.data()!;
    });

    return data;
  }

  // Future<Map> GetData () async {
  //   final collection = firestore.collection("puzzles");
  //   QuerySnapshot all_collections= await collection.get();
  //   List doc_list = all_collections.docs.map((doc) => doc.data()).toList();
  //   data = doc_list;
  //
  //   current_document= data[index];
  //   return current_document;
  // }

  ExtractData() {
    print(widget.document_name);
    for (int i = 0; i < data.length; i++) {
      // print("data :${data} ${data["$i"]}");
      print(data.length);
      Steps.insert(i,GestureDetector(
        onTap: () {

        },
        child: GridTile(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            alignment: Alignment.center,
            child : Column(
              children: [
                Text("${translate('how_to.step').toUpperCase()} ${i+1}",
                  style: TextStyle(fontSize: title_size, fontWeight: FontWeight.w900, ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0XFFFD0D1FF),
                    border: Border.all(
                      color: Color(0XFFFD0D1FF),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(20),
                          child: Image.network(data["$i"]["image"],
                          ),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child:Text(
                          translate('how_to.${widget.document_name}.step$i'),
                          textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      )
      );
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
            title: Text(translate('how_to.${widget.document_name}.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700)),
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
          child: Container(
              child :
                Column(
              children: [
                SizedBox(height: 10,),
                Container(
                    // height: size.height * 0.05,
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Text(translate('how_to.instruction'), style: TextStyle(
                      // foreground: Paint()
                      //   ..shader = textGradient, overflow: TextOverflow.visible,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(0, -5))
                        ],
                        color: Colors.transparent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                        decorationThickness: 2,
                      fontSize: title_size + 2, fontWeight: FontWeight.w700
                    ),)
                ),

                    FutureBuilder(
                      future: GetData(),
                      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                        if(snapshot.connectionState== ConnectionState.done){
                          print("in");
                          if(snapshot.hasError){
                            print("error");
                            return CircularProgressIndicator();
                          }
                          else if(snapshot.hasData){
                            print(snapshot);
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[...ExtractData()],)
                            ;
                          }
                        }
                        print("error1");
                        return CircularProgressIndicator();
                      },
                    )
                  ]
              )
          ),
        ),
    );
  }
}

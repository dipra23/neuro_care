import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dipra/style_.dart';
import 'package:dipra/widgets/question_formats/indexUpdate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '/homepage/bottomnavigation.dart';

import '../../values/app_icons.dart';

final FirebaseFirestore firestore= FirebaseFirestore.instance;

class mmse_questions extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _mmse_questionsState();
  }
}

class _mmse_questionsState extends State<mmse_questions> {
  final  _scoreController = new TextEditingController();

  List data = [];
  Map current_document = {};
  int current_index = 0;

  bool _isLoading = false;
  final user = FirebaseAuth.instance.currentUser;

  Future<List> GetData () async {
    final collection = firestore.collection("mmse");
    QuerySnapshot all_collections= await collection.get();
    List doc_list = all_collections.docs.map((doc) => doc.data()).toList();
    if(current_index<11){
      current_document= doc_list[current_index];
    }
    return doc_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFC9EBED),
          title: current_index <= 10 ? Text("${translate('mmse.title')} ${current_index+1}", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),) : Text(translate('mmse.score_title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
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
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            :  SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: FutureBuilder(
                builder: (ctx, snapshot){
                  if (snapshot.hasData) {
            if(current_index< 11){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // height: 250,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color:  Color(0XFFFF5DEDE),
                            border: Border.all(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("${translate('mmse.question_instruction')} \n\n${translate('mmse.${current_index+1}.question')}", style: TextStyle(
                          fontSize: title_size, fontWeight: FontWeight.w900
                        ), textAlign: TextAlign.center,),),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        margin: EdgeInsets.all(20),
                        // height: 200,
                        // decoration: BoxDecoration(
                        //     color:  Color(0XFFFD0D1FF),
                        //     border: Border.all(
                        //       width: 2,
                        //     ),
                        //     borderRadius: BorderRadius.circular(20)
                        //
                        // ),
                        child: Text("${translate('mmse.score_instruction')} \n\n${translate('mmse.${current_index+1}.score')}", style: TextStyle(
                            fontSize: button_size, fontWeight: FontWeight.w900), textAlign: TextAlign.center,)),
                    ElevatedButton(onPressed: () {
                      setState(() {
                        current_index ++;
                      });
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFFD0D1FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                        // minimumSize: const Size(double.infinity, 50),
                        // textStyle: TextStyle(fontSize: 14),
                        shadowColor: Color(0XFFFC9EBED),
                        elevation: 5,
                      ),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(translate('mmse.next_btn'), style: TextStyle(fontSize: title_size,color: Colors.white, fontWeight: FontWeight.w800))),
                    )
                  ],
                ),
              );
            }
            else{
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(30),
                        // height: 100,
                        // decoration: BoxDecoration(
                        //     color:  Color(0XFFFD0D1FF),
                        //     border: Border.all(
                        //       width: 2,
                        //     ),
                        //     borderRadius: BorderRadius.circular(20)
                        //
                        // ),
                        child: Text(translate('mmse.score_subtitle'),
                            style: TextStyle(
                                fontSize: title_size, fontWeight: FontWeight.w900
                        ), textAlign: TextAlign.center,)),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //     child: Image.asset(AppIcons.MMSE)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Table(
                        border: TableBorder.all(),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(80),
                          1: FlexColumnWidth(),
                        },
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: Text(translate('mmse_score.col_score'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w800)),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                ),
                                Container(
                                  child: Text(translate('mmse_score.col_interpret'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w800)),
                                  padding: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 5),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: Text("24-30", style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w500)),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                ),
                                Container(
                                  child: Text(translate('mmse_score.row_1'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w500)),
                                  padding: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 5),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: Text("20-23", style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w500)),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                ),
                                Container(
                                  child: Text(translate('mmse_score.row_2'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w500)),
                                  padding: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 5),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: Text("10-19", style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w500)),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                ),
                                Container(
                                  child: Text(translate('mmse_score.row_3'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w500)),
                                  padding: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 5),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(
                                  child: Text("0-9", style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w500)),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                ),
                                Container(
                                  child: Text(translate('mmse_score.row_4'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w500)),
                                  padding: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 5),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: TextField(
                        controller: _scoreController,
                        keyboardType: TextInputType.number,
                        showCursor: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(translate('mmse.score_label'))
                        ),
                        obscureText: false,
                        cursorWidth: 3,
                        // cursorHeight: 7,
                        cursorColor: Colors.pinkAccent,
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () async {

                        if(_scoreController.text != null) {
                          DateTime now = DateTime.now();
                          int day = now.day;
                          int month = now.month;
                          int year = now.year;

                          String date = "$day/$month/$year";
                          mmse_score[date] = _scoreController.text;

                          setState(() {
                            _isLoading = true;
                          });

                          await FirebaseFirestore.instance.collection('Users')
                              .doc(user?.uid)
                              .update({
                            'mmse_score': mmse_score,
                          });

                          setState(() {
                            _isLoading = false;
                          });

                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => BottomNavigationExample()));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(translate('mmse_score.error')),
                              action: SnackBarAction(
                                label: translate('mmse_score.error_label'),
                                onPressed: () {
                                  // Code to execute.
                                },
                              ),
                            ),
                          );
                        }
                      },
                  child: Container(
            // width: 100,

            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(20)
            ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text(translate('mmse.score_btn'), textAlign: TextAlign.center,style: TextStyle(fontSize: title_size,color: Colors.white,fontWeight: FontWeight.w800 )))
                    )
                  ],
                ),
              );
            }
          }
          else if(snapshot.hasError){
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: button_size),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
          },
              future: GetData(),
          ),
        ),
      )
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../style_.dart';
import '../../values/app_icons.dart';
import '../../widgets/question_formats/indexUpdate.dart';

final FirebaseFirestore firestore= FirebaseFirestore.instance;

class MMSE_Score extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MMSE_ScoreState();
  }

}

class _MMSE_ScoreState extends State<MMSE_Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0XFFFC9EBED),
            title: Text(translate('mmse_score.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
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
        body:  SingleChildScrollView(
        child: Container(
          child : Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),

                child: Text(translate('mmse_score.instruction'),
                  style: TextStyle(
                      fontSize: title_size, fontWeight: FontWeight.w900
                  ), textAlign: TextAlign.center,)),
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
                    height: 30,
                  ),
              Row(
                children: <Widget>[
                  const SizedBox(width: 30,),
                  const Expanded(
                      child: Divider( thickness: 4, color: Color(0XFFFC9EBED),)
                  ),
                  const SizedBox(width: 20,),
                  Text(translate('mmse_score.history.title'), style: TextStyle(fontWeight: FontWeight.w700, fontSize: title_size),),
                  const SizedBox(width: 20,),
                  const Expanded(
                      child: Divider(thickness: 4, color: Color(0XFFFC9EBED),)
                  ),
                  const SizedBox(width: 30, ),
                ]
              ),
              SizedBox(height: 30,),
              (mmse_score != null) ?
              Container(
               alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 30,
                    dataRowMinHeight: 30,
                    dataRowMaxHeight: 35,
                    border: TableBorder.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    columns: [
                      DataColumn(
                        label: Expanded(
                          child: Text('', style: TextStyle(fontWeight: FontWeight.w700, fontSize: title_size), textAlign: TextAlign.center),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(translate('mmse_score.history.col1'), style: TextStyle(fontWeight: FontWeight.w700, fontSize: title_size), textAlign: TextAlign.center),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(translate('mmse_score.history.col2'), style: TextStyle(fontWeight: FontWeight.w700, fontSize: title_size), textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                    rows: mmse_score.entries.toList().asMap().map((index, entry) {
                      return MapEntry(index, DataRow(cells: [
                        DataCell(Center(
                            child: Text((index + 1).toString(), // The index is your row number
                                style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w600)))),
                        DataCell(Center(
                            child: Text(entry.key.toString(), // Access the key (e.g., date)
                                style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w600)))),
                        DataCell(Center(
                            child: Text(entry.value.toString(), // Access the value (e.g., score)
                                style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w600)))),
                      ]));
                    }).values.toList()
                  ),
                ),
              ) :
              Text("No Scores", style: TextStyle(fontSize: title_size, fontWeight: FontWeight.w600),)
            ],
          ),
        )
      )
    );
  }

}
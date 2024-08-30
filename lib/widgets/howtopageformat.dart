// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:neuro_care/values/PuzzleImages.dart';
//
// import '../fetching_colouringbook.dart';
// import '../radiolisttexts.dart';
// import '../values/app_icons.dart';
// import '../screens/identification/identification.dart';
//
// class HowToPages extends StatefulWidget{
//    HowToPages({Key? key, required this.collection_name}) : super(key: key);
//    String collection_name;
//   @override
//   State<StatefulWidget> createState() {
//     return _HowToPagesState();
//   }
//
// }
// class _HowToPagesState extends State<HowToPages> {
//   late List data;
//   late Map current_document;
//
//   void initState({
//   final collection = firestore.collection(widget.collection_name);
//   QuerySnapshot all_collections= await collection.get();
//   List doc_list = all_collections.docs.map((doc) => doc.data()).toList();
//   print(doc_list);
//   data = doc_list;
// })
//   Widget GetData () async {
//
//     List<Widget> Steps= [];
//     for(int i= 0; i<data.length; i++){
//        current_document= data[i];
//        Steps.add(Column(
//          children: [
//            Container(
//                child: Image.asset(current_document["image"]),
//                height:100,
//                width: 100
//            ),
//            Container(
//              child: Text(current_document["caption"]),
//            )
//          ],
//        ),);
//
//     }
//     return Steps;
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     final Shader textGradient = LinearGradient(
//       colors: [Colors.green, Colors.blue],
//     ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 60.0));
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Color(0XFFF5DEDE),
//           title: Text(widget.collection_name, textAlign: TextAlign.center,),
//           centerTitle: true,
//           leading: IconButton(onPressed: () {
//             setState(() {
//               Navigator.pop(context);
//             });
//           },
//             icon: SvgPicture.asset(AppIcons.LEFTARROW,
//             ),
//
//
//           )
//
//       ),
//       body: Column(
//
//           children: [
//            Container(
//              height: size.height*0.05,
//              margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
//              child: Text("IN 5 SIMPLE STEPS...",style: TextStyle(
//                foreground: Paint()..shader = textGradient,overflow: TextOverflow.visible,
//
//                fontSize: 32,
//              ),)
//            ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child:
//
//               Row(
//                 children:
//                 [GetData()]
//
//                 ],
//               )
//             )
//
//
//
//
//           ]
//
//       ),
//
//     );
//   }
// }
//

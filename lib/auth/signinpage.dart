// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import '/auth/profilepage.dart';
// import '/homepage/bottomnavigation.dart';
// import '/user_onboarding/details.dart';
// import 'signin.dart';
// import '/main.dart';
// final FirebaseFirestore firestore= FirebaseFirestore.instance;
//
// // class SignInPage extends StatefulWidget{
// //   @override
// //   State<StatefulWidget> createState() {
// //     return _SignInPage();
// //   }
// //
// // }
//
// class SignInPage extends StatelessWidget {
//
//   CheckData(String uid, BuildContext context) async {
//    // final FirebaseAuth auth= FirebaseAuth.instance;
//    // final uid= auth.currentUser?.uid;
//
//    final collection= firestore.collection("Users");
//    DocumentSnapshot<Map<String, dynamic>> doc = await collection.doc(uid).get();
//    if(doc.exists){
//      if(doc["FullName"] != null){
//        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationExample())) ;
//      }
//      else{
//        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(uid:uid))) ;
//      }
//    }
//    else{
//      Navigator.push(context, MaterialPageRoute(builder: (context) => Details(uid:uid))) ;
//    }
//    }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: LayoutBuilder(
//             builder: (context, constraints) {
//               return Row(
//                 children: [
//                   Visibility(
//                     visible: constraints.maxWidth >= 1200,
//                     child: Expanded(
//                       child: Container(
//                         height: double.infinity,
//                         color: Theme
//                             .of(context)
//                             .colorScheme
//                             .primary,
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Firebase Auth Desktop',
//                                 style: Theme
//                                     .of(context)
//                                     .textTheme
//                                     .headlineMedium,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: constraints.maxWidth >= 1200
//                         ? constraints.maxWidth / 2
//                         : constraints.maxWidth,
//                     child: StreamBuilder<User?>(
//                       stream: auth.authStateChanges(),
//                       builder: (context, snapshot) {
//
//                         if(snapshot.connectionState != ConnectionState.active){
//                           return CircularProgressIndicator();
//                         }
//
//
//                          if(snapshot.data != null){
//                            CheckData(snapshot.data!.uid, context);
//                            return Container();
//                          } else{
//                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthGate()));
//                            return Container();
//                          }
//
//
//
//
//
//
//
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             }
//         )
//     );
//   }
// }
//

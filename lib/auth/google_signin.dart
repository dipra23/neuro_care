//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '/auth/signin.dart';
// import '/homepage/bottomnavigation.dart';
//
// import '../main.dart';
// import '../user_onboarding/details.dart';
// final FirebaseFirestore firestore= FirebaseFirestore.instance;
//
// // class GoogleSignInScreen extends StatefulWidget {
// //   const GoogleSignInScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
// // }
// final FirebaseAuth auth= FirebaseAuth.instance;
// class GoogleSignInScreen extends StatelessWidget {
//
//   final uid= auth.currentUser?.uid;
//   ValueNotifier userCredential = ValueNotifier('');
//   Future<dynamic> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//       final GoogleSignInAuthentication? googleAuth =
//       await googleUser?.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//
//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } on Exception catch (e) {
//       // TODO
//       print('exception->$e');
//     }
//   }
//
//   Future<bool> signOutFromGoogle() async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       return true;
//     } on Exception catch (_) {
//       return false;
//     }
//   }
//
//    Future<void> CheckData(BuildContext context ) async {
//
//
//     final collection= firestore.collection("Users");
//     DocumentSnapshot<Map<String, dynamic>> doc = await collection.doc(uid).get();
//
//     print(doc.exists);
//     if(doc.exists){
//       if(doc["FullName"] != null){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationExample())) ;
//       }
//       else{
//         Navigator.push(context, MaterialPageRoute(builder: (context) => Details(uid:uid))) ;
//       }
//     }
//     else{
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Details(uid:uid))) ;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(title: const Text('Google SignIn Screen')),
//         body: ValueListenableBuilder(
//             valueListenable: userCredential,
//             builder: (context, value, child) {
//               return (userCredential.value == '' ||
//                   userCredential.value == null)
//                   ? Center(
//                 child: Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   child: IconButton(
//                     iconSize: 40,
//                     icon: Icon(Icons.login),
//                     onPressed: () async {
//                       userCredential.value = await signInWithGoogle();
//                       if (userCredential.value != null)
//                         print(userCredential.value.user!.email);
//                       CheckData(context);
//                     },
//                   ),
//                 ),
//               )
//                   : CircularProgressIndicator();
//               }),
//               // StreamBuilder<User?>(
//               //   stream: auth.authStateChanges(),
//               //   builder: (context, snapshot) {
//               //
//               //     if(snapshot.connectionState != ConnectionState.active){
//               //       return CircularProgressIndicator();
//               //     }
//               //
//               //
//               //     if(snapshot.data != null){
//               //       CheckData(snapshot.data!.uid, context);
//               //       return Container();
//               //     } else{
//               //       Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleSignInScreen()));
//               //       return Container();
//               //     }
//               //
//               //
//               //
//               //
//               //
//               //
//               //
//               //   },
//               // );
//
//               //CheckData(snapshot.data!.uid, context);
//
//
//               // Center(
//               //   child: Column(
//               //     crossAxisAlignment: CrossAxisAlignment.center,
//               //     mainAxisAlignment: MainAxisAlignment.center,
//               //     children: [
//               //       Container(
//               //         clipBehavior: Clip.antiAlias,
//               //         decoration: BoxDecoration(
//               //             shape: BoxShape.circle,
//               //             border: Border.all(
//               //                 width: 1.5, color: Colors.black54)),
//               //         child: Image.network(
//               //             userCredential.value.user!.photoURL.toString()),
//               //       ),
//               //       const SizedBox(
//               //         height: 20,
//               //       ),
//               //       Text(userCredential.value.user!.displayName
//               //           .toString()),
//               //       const SizedBox(
//               //         height: 20,
//               //       ),
//               //       Text(userCredential.value.user!.email.toString()),
//               //       const SizedBox(
//               //         height: 30,
//               //       ),
//               //       ElevatedButton(
//               //           onPressed: () async {
//               //             bool result = await signOutFromGoogle();
//               //             if (result) userCredential.value = '';
//               //           },
//               //           child: const Text('Logout'))
//               //     ],
//               //   ),
//               // );
//             );
//   }}
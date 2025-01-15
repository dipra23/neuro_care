import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dipra/screens/family_members/addFamilyMembers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '/homepage/bottomnavigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/login_email.dart';
import 'firebase_options.dart';
import 'widgets/question_formats/indexUpdate.dart';
import 'package:speech_to_text/speech_to_text.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en_US',
      supportedLocales: ['en_US', 'hi']);
  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: 'Neurocare',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}


class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  Future<Map<String, dynamic>> getData() async {
    DocumentReference docRef = FirebaseFirestore.instance.collection("Users").doc(user?.uid);
    DocumentSnapshot snapshot = await docRef.get();
    return snapshot.data() as Map<String, dynamic>;
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () async {
      // FirebaseAuth.instance.signOut();
      // SpeechToText speechToText = SpeechToText();
      // var availableLocales = await speechToText.locales();
      // availableLocales.forEach((locale) {
      //   print('${locale.name}: ${locale.localeId}');
      // });
      if (user == null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => emailLogin()));
      } else {

        Map<String, dynamic> data = await getData();

        total_points = data["total_points"] ?? 0;
        puzzle_number = data["puzzle_number"] ?? 0;
        locations_360 = data["locations_360"] ?? 0;
        meditation = data["meditation"] ?? 0;
        hard_puzzles = data["hard_puzzles"] ?? 0;
        quizzes = data["quizzes"] ?? 0;
        drawings = data["drawings"] ?? 0;
        languages = data["languages"] ?? 0;
        sounds = data["sounds"] ?? 0;
        mmse_score = data["mmse_score"] ?? {};

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationExample()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/neurocare.png', width: 250, height: 250),
        ),
      ),
    );
  }
}
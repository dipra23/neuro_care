import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:validation_textformfield/validation_textformfield.dart';
import 'ProfileMenuWidget.dart';

class AboutUsScreen extends StatefulWidget{

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(translate('about_us.title'), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24), textAlign: TextAlign.center,),
        centerTitle: true,
        backgroundColor: Color(0XFFFD0D1FF),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, )),
      ),
      body : SingleChildScrollView(
        child : Center(
          child : Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child : Column(
              children: [
                SizedBox(height: 30,),
                Image.asset("assets/neurocare.png", width: 150, height: 100,),
                Text(translate('about_us.subtitle'), style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xFF116796)), textAlign: TextAlign.center,),
                // SizedBox(height: 10,),
                // Text("Accurate Injury Insights,\n Anytime, Anywhere", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF116796)), textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                Text(translate('about_us.content'), style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,)
              ],
            )
          ),
        ),
      ),
    );
  }
}
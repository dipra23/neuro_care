import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:validation_textformfield/validation_textformfield.dart';

class ContactUsScreen extends StatefulWidget{

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final String email = "diprabaid2007@gmail.com";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(translate('contact_us.title'), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24), textAlign: TextAlign.center,),
        centerTitle: true,
        backgroundColor: Color(0XFFFD0D1FF),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, )),
      ),
      body : SingleChildScrollView(
        child : Center(
          child : Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Image.asset("assets/neurocare.png", width: 200, height: 200,),
                SizedBox(height: 30,),
                Text(translate('contact_us.msg'),
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                // InkWell(
                //   onTap: () => _launchPhoneCall(phoneNumber),
                //   child: Row(
                //     children: [
                //       Icon(Icons.phone, color: Colors.blue),
                //       SizedBox(width: 10),
                //       Text(
                //         phoneNumber,
                //         style: TextStyle(
                //           fontSize: 18,
                //
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, color: Colors.blue),
                      SizedBox(width: 10),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
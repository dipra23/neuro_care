import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
  return _ProfileState();
  }
}

class _ProfileState extends State<Profile>{

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          signOutFromGoogle();

        }, child: Text("Log out"),

      ),
    );
  }

}
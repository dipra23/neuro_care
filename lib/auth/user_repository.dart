


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neuro_care/auth/user_model.dart';
import 'signinpage.dart';

class UserRepository {
   final _db= FirebaseFirestore.instance;
  createUser(User_Model user, uid) {
     _db.collection("Users").doc(uid).set(user.toJson());
  }
}
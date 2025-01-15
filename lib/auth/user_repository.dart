


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/auth/user_model.dart';
import 'signinpage.dart';

class UserRepository {
  final _db= FirebaseFirestore.instance;
  createUser(User_Model user, uid) {
    _db.collection("Users").doc(uid).set(user.toJson());
  }
  updateUser(User_Update_Model user, uid){
    _db.collection("Users").doc(uid).update(user.toJson());
  }
  updatePoints(Points_Update_Model user, uid){
    _db.collection("Users").doc(uid).update(user.toJson());
  }
}


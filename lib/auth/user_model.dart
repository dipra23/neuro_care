import 'package:flutter/material.dart';
class User_Model{
  const User_Model({
    required this.Id, required this.fullname, required this.email, required this.password,
  required this.age, required this.sex,required this.nationality, required this.city, required this.country
  });
  final String Id;
  final String fullname;
  final String email;
  final String password;
  final String age;
  final String sex;
  final String nationality;
  final String city;
  final String country;


  toJson(){
    return{
      "FullName": fullname,
      "Email": email,
      "Password": password,
      "Age": age,
      "Sex": sex,
      "Nationality": nationality
    };
  }




}
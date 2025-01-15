import 'package:flutter/material.dart';
class User_Model{
  const User_Model({
    required this.fullname, required this.total_points,  required this.meditation,
    required this.hard_puzzles,   required this.quizzes,
    required this.locations_360,   required this.drawings,
    required this.puzzle_number,required this.sounds,  required this.languages, required this.current_points,required this.email, required this.age, required this.sex,required this.nationality, required this.image,
  });
  final String fullname;
  final String? email;
  final String age;
  final String sex;
  final String nationality;
  final String image;
  final int total_points ;
  final int current_points;
  final int puzzle_number;
  final int locations_360;
  final int meditation;
  final int hard_puzzles;
  final int quizzes;
  final int drawings;
  final int languages;
  final int sounds;


  toJson(){
    return{
      "FullName": fullname,
      "Email": email,
      "Age": age,
      "Sex": sex,
      "Nationality": nationality,
      "Image" : image,
      "total_points" :total_points,
      "current_points" : current_points,
      "puzzle_number": puzzle_number,
      "hard_puzzles" : hard_puzzles,
      "locations_360" : locations_360,
      "meditation": meditation,
      "quizzes": quizzes,
      "drawings": drawings,
      "languages" : languages,
      "sounds" : sounds

    };
  }
}

class Points_Update_Model {
  const Points_Update_Model({
    required this.total_points,  required this.meditation,
    required this.hard_puzzles,   required this.quizzes,
    required this.locations_360,   required this.drawings,
    required this.puzzle_number,required this.sounds,  required this.languages, required this.current_points
  });

  final int total_points ;
  final int current_points;
  final int puzzle_number;
  final int locations_360;
  final int meditation;
  final int hard_puzzles;
  final int quizzes;
  final int drawings;
  final int languages;
  final int sounds;


  toJson() {
    return {
      "total_points" :total_points,
      "current_points" : current_points,
      "puzzle_number": puzzle_number,
      "hard_puzzles" : hard_puzzles,
      "locations_360" : locations_360,
      "meditation": meditation,
      "quizzes": quizzes,
      "drawings": drawings,
      "languages" : languages,
      "sounds" : sounds

    };
  }
}

class User_Update_Model {
  const User_Update_Model({
    required this.fullname, required this.age, required this.sex,required this.nationality, required this.image
  });

  final String fullname;
  final String age;
  final String sex;
  final String nationality;
  final String image;


  toJson() {
    return {
      "FullName": fullname,
      "Age": age,
      "Sex": sex,
      "Nationality": nationality,
      "Image": image,

    };
  }
}
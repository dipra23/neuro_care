import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/question_formats/indexUpdate.dart';


class Achievements extends StatefulWidget {
  @override
  State<Achievements> createState() => AchievementsState();
}

class AchievementsState extends State<Achievements> {

  final List<Map<String, dynamic>> achievementData = [
    {
      'image': "assets/achievements/scholar_icon.png",
      'name': translate('achievements.quiz.name'),
      'finalValue': 20,
      'scoreValue': quizzes,
      'description': translate('achievements.quiz.description'),
      'color': Color(0x8492DEEE),
    },
    {
      'image': "assets/achievements/intelligent_icon.png",
      'name': translate('achievements.puzzle.name'),
      'finalValue': 15,
      'scoreValue': puzzle_number,
      'description': translate('achievements.puzzle.description'),
      'color': Color(0x8492DEEE),
    },
    {
      'image': "assets/achievements/magic.png",
      'name': translate('achievements.360.name'),
      'finalValue': 5,
      'scoreValue': locations_360,
      'description': translate('achievements.360.description'),
      'color': Color(0x59CE9C9C),
    },
    {
      'image': "assets/achievements/zen_master.png",
      'name': translate('achievements.meditation.name'),
      'finalValue': 30,
      'scoreValue': meditation,
      'description': translate('achievements.meditation.description'),
      'color': Color(0x8492DEEE),
    },
    {
      'image': "assets/achievements/mastermind.png",
      'name': translate('achievements.hard_puzzle.name'),
      'finalValue': 10,
      'scoreValue': hard_puzzles,
      'description': translate('achievements.hard_puzzle.description'),
      'color': Color(0xFFBDB0E1),
    },
    {
      'image': "assets/achievements/wiz.png",
      'name': translate('achievements.language.name'),
      'finalValue': 10,
      'scoreValue': languages,
      'description': translate('achievements.language.description'),
      'color': Color(0x7CB6B2B2),
    },
    {
      'image': "assets/achievements/auditory_ace.png",
      'name': translate('achievements.sounds.name'),
      'finalValue': 15,
      'scoreValue': sounds,
      'description': translate('achievements.sounds.description'),
      'color': Color(0xFFBDB0E1),
    },
    {
      'image': "assets/achievements/art_aficionado.png",
      'name': translate('achievements.drawing.name'),
      'finalValue': 5,
      'scoreValue': drawings,
      'description': translate('achievements.drawing.description'),
      'color': Color(0x8492DEEE),
    },
  ];

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFBDB0E1),
      appBar: AppBar(
          backgroundColor: Color(0XFFFD0D1FF),
          title: Text(translate('achievements.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: appbar_size),),
          centerTitle: true,
          automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 25),
              Container(
                alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.stars, color: Colors.blue, size: 24,),
                      SizedBox(width: 3,),
                      Text("$total_points", style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: Colors.blue),),
                    ],
                  )
              ),
              SizedBox(height: 20),

              Column(
                children: achievementData.map((achievement) {
                  return AchievementTile(
                    image: achievement['image'],
                    name: achievement['name'],
                    finalValue: achievement['finalValue'],
                    scoreValue: achievement['scoreValue'],
                    description: achievement['description'],
                    color: achievement['color'],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AchievementTile extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final Color color;
  final int finalValue;
  final int scoreValue;

  AchievementTile({
    required this.image,
    required this.name,
    required this.description,
    required this.finalValue,
    required this.scoreValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0XFFC9EBED),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color, // Set the background color
              shape: BoxShape.circle, // Make the shape a circle
              border: Border.all(
                color: Colors.white, // Set the border color
                width: 2, // Set the border width
              ),
            ),
            padding: EdgeInsets.all(7),
            child: ClipRRect(
              child: Image.asset(
                image,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: title_size,
                        fontFamily: "Cooper",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "$scoreValue/$finalValue",
                      style: TextStyle(
                        fontSize: content_size,
                        fontFamily: "Cooper",
                        fontStyle: FontStyle.normal,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Stack(
                  children: [
                    Container(
                      width: 240,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFCFE2F3),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      width: (scoreValue / finalValue) * 240 ,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFF4B9B8),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: content_size,
                    fontFamily: "Cooper",
                    fontStyle: FontStyle.normal,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

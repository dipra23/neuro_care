import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../../auth/user_model.dart';
import '../../../auth/user_repository.dart';
import '../../../homepage/bottomnavigation.dart';
import '../../../widgets/question_formats/indexUpdate.dart';
import 'data.dart';
import 'dart:async';

class MemoryFlip extends StatefulWidget {

  const MemoryFlip({Key? key, required this.level}) : super(key: key);
  final String level;

  @override
  _MemoryFlipState createState() => _MemoryFlipState();
}

class _MemoryFlipState extends State<MemoryFlip> {

  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;

  bool _wait = false;
  late String level;
  late Timer _timer;
  int _time = 5;
  late int _left;
  late bool _isFinished;
  late List<dynamic> _data;

  late List<bool> _cardFlips;
  late List<GlobalKey<FlipCardState>> _cardStateKeys;

  final controller = ConfettiController();
  final userRepo = UserRepository();
  void updatePoints(Points_Update_Model user, String? uid){
    userRepo.updatePoints(user, uid);
  }
  User? user_ = FirebaseAuth.instance.currentUser;

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 3,
            spreadRadius: 0.8,
            offset: Offset(2.0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3, // Adjust this to control the space for the image
            child: Image.asset(
                "assets/memory/${_data[index]}.png",
                fit: BoxFit.contain, // Ensures the image scales properly
            ),
          ),
          Expanded(
            flex: 1, // Adjust this to control the space for the text
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                translate('memory_game.${_data[index]}'),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        _time = _time - 1;
      });
    });
  }

  void restart() {
    startTimer();
    _data = getSourceArray(
      level,
    );
    _cardFlips = getInitialItemState(level);
    _cardStateKeys = getCardStateKeys(level);
    _time = 5;
    _left = (_data.length ~/ 2);

    _isFinished = false;
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _start = true;
        _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    level = widget.level;
    print(level);
    restart();
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isFinished
        ? Stack(
          children: [
          Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
            height: 100,
            width: 200,
            padding: const EdgeInsets.all(10.0),
            child:Column(
              children: [
                Text(translate('success.title'),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Text(translate('success.msg'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
              ],
            ),
          ),
              Container(
                child:widget.level== 'easy'?
                Text(translate('success.easy_points'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700), textAlign: TextAlign.center,):
                widget.level== 'intermediate'?
                Text(translate('success.intermediate_points'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700), textAlign: TextAlign.center,):
                Text(translate('success.hard_points'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                width: 200,
                padding: const EdgeInsets.all(10.0),
                // margin: const EdgeInsets.all(20.0),
              ),
              SizedBox(height: 30,),
              GestureDetector(
            onTap: () {
              setState(() {
                restart();
              });
            },
            child: Container(
              height: 50,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0XFFFF5DEDE),
                  borderRadius: BorderRadius.all(Radius.circular(23))
              ),
              child: Text(
                translate('puzzles.play_again_btn'),
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavigationExample()),
                  );
                },
                child: Container(
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0XFFFD0D1FF),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    translate('puzzles.home_btn'),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              ]
                ),
              ),
          ),
            ConfettiWidget(
                confettiController: controller,
                shouldLoop: true,
                blastDirectionality: BlastDirectionality.explosive
            )
          ]
        )
        : Scaffold(
      appBar: AppBar(
        title: Text(translate('memory_game.title')),
        centerTitle: true,
        backgroundColor: Color(0XFFF5DEDE),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _time > 0
                      ? Text(
                    '$_time',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  )
                      : Text(
                    '${translate('memory_game.left')} : $_left',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    alignment: Alignment.center,
                    margin: (level == "easy") ? EdgeInsets.symmetric(horizontal: 60) : EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (level == "easy") ? 2 : 3,
                          mainAxisSpacing: 7,
                          crossAxisSpacing: 7
                      ),
                      itemBuilder: (context, index) => _start
                          ? FlipCard(
                          key: _cardStateKeys[index],
                          onFlip: () {
                            if (!_flip) {
                              _flip = true;
                              _previousIndex = index;
                            } else {
                              _flip = false;
                              if (_previousIndex != index) {
                                if (_data[_previousIndex] !=
                                    _data[index]) {
                                  _wait = true;

                                  Future.delayed(
                                      const Duration(milliseconds: 1500),
                                          () {
                                        _cardStateKeys[_previousIndex]
                                            .currentState
                                            ?.toggleCard();
                                        _previousIndex = index;
                                        _cardStateKeys[_previousIndex]
                                            .currentState
                                            ?.toggleCard();

                                        Future.delayed(
                                            const Duration(milliseconds: 160),
                                                () {
                                              setState(() {
                                                _wait = false;
                                              });
                                            });
                                      });
                                } else {
                                  _cardFlips[_previousIndex] = false;
                                  _cardFlips[index] = false;
                                  print(_cardFlips);
                                  setState(() {
                                    _left -= 1;
                                  });
                                  if (_cardFlips
                                      .every((t) => t == false)) {
                                    print("Won");
                                    Future.delayed(
                                      const Duration(milliseconds: 2000),
                                          () {
                                        setState(() {
                                          int points = widget.level == "easy" ? 5 :
                                          widget.level == "intermediate" ? 7 : 10;
                                          current_points += points;
                                          total_points += current_points;
                                          current_points = 0;

                                          final user = Points_Update_Model(
                                            total_points: total_points,
                                            meditation: meditation,
                                            hard_puzzles: hard_puzzles,
                                            quizzes: quizzes,
                                            locations_360: locations_360,
                                            drawings: drawings,
                                            puzzle_number: puzzle_number,
                                            sounds: sounds,
                                            languages: languages,
                                            current_points: current_points
                                          );
                                          updatePoints(user, user_?.uid);
                                          _isFinished = true;
                                          _start = false;
                                        });
                                      }
                                    );
                                  }
                                }
                              }
                            }
                            setState(() {});
                          },
                          flipOnTouch: _wait ? false : _cardFlips[index],
                          direction: FlipDirection.HORIZONTAL,
                          front: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 3,
                                    spreadRadius: 0.8,
                                    offset: Offset(2.0, 1),
                                  )
                                ]),
                            margin: EdgeInsets.all(4.0),
                            child: Image.asset(
                                "assets/memory/card.png",
                            ),
                          ),
                          back: getItem(index))
                          : getItem(index),
                      itemCount: _data.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';
import 'dart:math';

import '../homepage/bottomnavigation.dart';

class ExampleSpecifyTime extends StatefulWidget {
   ExampleSpecifyTime({Key? key}) : super(key: key);



  @override
  State<ExampleSpecifyTime> createState() => _ExampleSpecifyTimeState();
}



class _ExampleSpecifyTimeState extends State<ExampleSpecifyTime> {


  final GlobalKey<AnalogClockState> _analogClockKey = GlobalKey();
  DateTime dateTime = DateTime.now();
  DateTime datetime = DateTime.now();

   int get hour => GetHour();
  int get minutes => GetMinute();
  int get seconds => GetSeconds();



  int GetHour(){
    Random random = new Random();
    int hour = random.nextInt(12)+1;
    print(hour);
return hour;

  }
  int GetMinute(){
    Random random = new Random();
    int minutes= random.nextInt(61);
    print(minutes);
    return minutes;

  }
  int GetSeconds(){
    Random random = new Random();
    int seconds= random.nextInt(61);
    print(seconds);
    return seconds;

  }




  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Congratulations you are correct!"),
              content: Text("Awesome job keep going!"),
            actions: <Widget>[
              TextButton(
                child: const Text('Try another'),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ExampleSpecifyTime()));
                  });
                },
              ),
              TextButton(
                child: const Text('Exit to home'),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  BottomNavigationExample()));
                  });
                },
              ),
            ],
          );
        }
    );
  }
  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Unfortuntaley that is incorrect"),
              content: Text("That'd fine keep practising, Let's try another one!"),
            actions: <Widget>[
              TextButton(
                child: const Text('Try another'),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ExampleSpecifyTime()));
                  });
                },
              ),
              TextButton(
                child: const Text('Exit to home'),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  BottomNavigationExample()));
                  });
                },
              ),
            ],
          );
        }
    );
  }

@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Scaffold(
      appBar: AppBar(
        title: const Text('What is the time?'),
      ),
      body: Column(
        children: [
          Container(
            height: size.height*0.3,
            width: size.width*0.9,
            margin: EdgeInsets.all(15),
            child: AnalogClock(
              key: _analogClockKey,
              isKeepTime: false,
              dateTime: DateTime(
                  2024, 2, 3, hour, minutes, seconds),

            ),
          ),

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              height: size.height*0.2,
              width: size.width*0.9,
              child: TimePickerSpinner(
                locale: const Locale('en', ''),
                time: datetime,
                is24HourMode: false,
                isShowSeconds: true,
                itemHeight: 50,
                normalTextStyle: const TextStyle(
                  fontSize: 20,
                ),
                highlightedTextStyle:
                const TextStyle(fontSize: 20, color: Colors.blue),
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    datetime = time;
                  });
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  if(dateTime.hour == hour && dateTime.minute == minutes
                  && dateTime.second == seconds){
                    _showMyDialog();
                  }
                  else{
                    _showDialog();
                  }
                }, child: Text("submit"),

              ),
            )
          ],
        ),
      ),
    ]  // This trailing
    )
    );
  }
}
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter/material.dart';
class ExampleSpecifyTime extends StatefulWidget {
  const ExampleSpecifyTime({Key? key}) : super(key: key);

  @override
  State<ExampleSpecifyTime> createState() => _ExampleSpecifyTimeState();
}

class _ExampleSpecifyTimeState extends State<ExampleSpecifyTime> {
  final GlobalKey<AnalogClockState> _analogClockKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analog clock'),
      ),
      body: AnalogClock(
        key: _analogClockKey,
        dateTime: DateTime(2024, 2, 3, 1, 23, 45),
        isKeepTime: false,
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            _analogClockKey.currentState!.dateTime = DateTime.now();
          },
          child: const Text('Now'),
        ),
        ElevatedButton(
          onPressed: () {
            _analogClockKey.currentState!.isKeepTime = true;
          },
          child: const Text('Keep time'),
        ),
      ],
    );
  }
}
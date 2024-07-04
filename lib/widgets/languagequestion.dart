
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../values/app_icons.dart';

class Languages extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _LanguagesState();
  }

}

class _LanguagesState extends State<Languages> {
  final SpeechToText _speechToText= SpeechToText();
 bool _speechEnabled= false;
  bool _hasSpeech = false;
  bool _logEvents = false;
  bool _onDevice = false;
 String _wordsSpoken= "";
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();
 double _confidenceLevel= 0;
  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    _logEvent('Initialize');
    try {
      var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: _logEvents,
      );
      if (hasSpeech) {
        // Get the list of languages installed on the supporting platform so they
        // can be displayed in the UI for selection by the user.
        _localeNames = await speech.locales();

        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? '';
      }
      if (!mounted) return;

      setState(() {
        _hasSpeech = hasSpeech;
      });
    } catch (e) {
      setState(() {
        lastError = 'Speech recognition failed: ${e.toString()}';
        _hasSpeech = false;
      });
    }
  }



  void _startListening() {
    _logEvent('start listening');
    lastWords = '';
    lastError = '';
    final pauseFor = 5;
    final listenFor = 40;
    final options = SpeechListenOptions(
        onDevice: _onDevice,
        listenMode: ListenMode.confirmation,
        cancelOnError: true,
        partialResults: true,
        autoPunctuation: true,
        enableHapticFeedback: true);
    // Note that `listenFor` is the maximum, not the minimum, on some
    // systems recognition will be stopped before this value is reached.
    // Similarly `pauseFor` is a maximum not a minimum and may be ignored
    // on some devices.
    speech.listen(
      onResult: _onSpeechResult,
      listenFor: Duration(seconds: listenFor ?? 30),
      pauseFor: Duration(seconds: pauseFor ?? 3),
      localeId: _currentLocaleId,
      listenOptions: options,
    );
    setState(() {});
  }
  void statusListener(String status) {
    _logEvent(
        'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = status;
    });
  }
  void _stopListening() {
    _logEvent('stop');
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }
  void cancelListening() {
    _logEvent('cancel');
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }
  void _logEvent(String eventDescription) {
    if (_logEvents) {
      var eventTime = DateTime.now().toIso8601String();
      debugPrint('$eventTime $eventDescription');
    }
  }
  void _onSpeechResult(SpeechRecognitionResult result) {
    _logEvent(
        'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    setState(() {
      lastWords = '${result.recognizedWords} - ${result.finalResult}';
    });
  }
  void errorListener(SpeechRecognitionError error) {
    _logEvent(
        'Received error status: $error, listening: ${speech.isListening}');
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFF5DEDE),
          title: Text("LANGUAGES", textAlign: TextAlign.center,),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
            icon: SvgPicture.asset(AppIcons.LEFTARROW,
            ),


          )

      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(lastWords,
                style: TextStyle(
                  fontSize: 20
                ),),
              ),
            ),
            if(_speechToText.isNotListening && _confidenceLevel> 0)
              Text("Confidence : ${(_confidenceLevel*100).toStringAsFixed(1)}%",
              style: TextStyle(
                fontSize: 20
              ),)
            else Text("Confidence : ${(_confidenceLevel*100).toStringAsFixed(1)}%")
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _speechToText.isListening? _stopListening(): _startListening();

        },
        child: Icon(
          _speechToText.isNotListening? Icons.mic_off: Icons.mic_outlined,
              color: Colors.white,

        ),
        backgroundColor: Colors.black,
        tooltip: 'Listen',
      ),



  );
  }
}
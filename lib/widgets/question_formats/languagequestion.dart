
import 'dart:async';

import 'package:dipra/style_.dart';
import 'package:dipra/widgets/question_formats/question_format_five.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:text_typewriter/text_typewriter.dart';
import 'package:typing_text/typing_text.dart';
import '../../homepage/bottomnavigation.dart';
import '../../screens/identification/identification.dart';
import '/widgets/question_formats/sucesspage.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../values/app_icons.dart';
import 'failpage.dart';
import 'indexUpdate.dart';

class Language_Format_Zero extends StatefulWidget{
  const Language_Format_Zero(
      {Key? key,
        required this.text,
        required this.category,
        required this.collection_name,
      required this.level, })
      : super(key: key);
  final String text;
  final String level;
  final String collection_name;
  final String category;
  @override
  State<StatefulWidget> createState() {
   return _LanguagesState();
  }
}

class _LanguagesState extends State<Language_Format_Zero> {
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
    print(widget.category);
  }

  @override
  void dispose(){
    speech.stop();
    speech.cancel();
    super.dispose();
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
      print("Initialized");
      if (!mounted) return;
      setState(() {
        _hasSpeech = hasSpeech;
      });
    } catch (e) {
      setState(() {
        lastError = 'Speech recognition failed: ${e.toString()}';
        print(lastError);
        _hasSpeech = false;
      });
    }
  }

  void _startListening() {
    _logEvent('start listening');
    lastWords = '';
    lastError = '';
    final pauseFor = 3;
    final listenFor = 100;
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
      listenFor: Duration(seconds: listenFor ?? 100),
      pauseFor: Duration(seconds: pauseFor ?? 3),
        listenOptions: options,
      localeId: language_ == "hi" ? "hi_IN" : _currentLocaleId
    );
    setState(() {});
    print("listening");
  }

  void statusListener(String status) {
    _logEvent(
        'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = status;
    });
  }

  void _stopListening() {
    print("stop");
    _logEvent('stop');
    speech.stop();
      level = 0.0;
      if(lastWords.split(" - ")[0].toLowerCase().trim() == widget.text.toLowerCase().trim().replaceAll(".", "").replaceAll("?", "")){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Congratulations(category: 'languages', collection_name: widget.collection_name, level: widget.category,)));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Fail(category: 'languages', collection_name: widget.collection_name, level: widget.category, answer: widget.text,)));
      }
  }

  void cancelListening() {
    _logEvent('cancel');
    print("cancel");
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

  void _checkAnswer() {
    index++;
    print("Checking answer: $lastWords");
    if (lastWords.split(" - ")[0].toLowerCase().trim() == translate('${widget.collection_name}.${widget.text}.check').toLowerCase().trim().replaceAll(".", "").replaceAll("?", "").replaceAll("hoon", "hun")) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Congratulations(category: 'languages', collection_name: widget.collection_name, level: widget.category,)));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Fail(category: 'languages', collection_name: widget.collection_name, level: widget.category, answer: translate('${widget.collection_name}.${widget.text}.display'),)));
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _logEvent(
        'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    setState(() {
      lastWords = '${result.recognizedWords} - ${result.finalResult}';
      print(lastWords);
    });
    if (!speech.isListening && lastWords.isNotEmpty) {
      Timer(const Duration(seconds: 2),
              (){
        _checkAnswer();
        }
      );
    }
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFF5DEDE),
          title: Text(translate('${widget.collection_name}.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            setState(() {
              index = 0;
              Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavigationExample()));
            });
          },
            icon: SvgPicture.asset(AppIcons.LEFTARROW,),
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Container(
                  height: size.height*0.1,
                  child: Text(translate('${widget.collection_name}.instruction'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: appbar_size),
                  ),),
                Container(
                  // height: size.height*0.1,
                  child: Text(translate('${widget.collection_name}.${widget.text}.display'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: appbar_size),
                  ),
                ),
                  SizedBox(height: 20,),
                  Container(
                    // height: size.height*0.2,
                    padding: EdgeInsets.all(15),
                    child: Text(lastWords.split(" - ")[0].toString().capitalize(), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: title_size, color: Colors.grey),),
                  ),
                ]
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: (){
                        _speechToText.isListening? _stopListening(): _startListening();
                      },
                      child: Icon(
                        _speechToText.isNotListening? Icons.mic_off: Icons.mic_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      minimumSize: const Size(50, 50),
                      // textStyle: TextStyle(fontSize: 14),
                      shadowColor: Color(0XFFFC9EBED),
                      elevation: 5,
                    ),
                  ),
                  SizedBox(height: 10,),
                  _speechToText.isNotListening?
                      Text("Speak", style: TextStyle(fontSize: title_size, fontWeight: FontWeight.w700),)
                      :
                      // TypingText(
                      //    words: ['Listening', '...'],
                      //    letterSpeed: Duration(milliseconds: 100),
                      //    wordSpeed: Duration(milliseconds: 500),
                      //    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Listening", style: TextStyle(fontSize: title_size, fontWeight: FontWeight.w700),),
                      Typewriter(
                        ['...', ''],
                        textstyle: TextStyle(color: Colors.black, fontSize: title_size, fontWeight: FontWeight.w700),
                        loop: true,
                        erase: true,
                        tailingtext: '_',
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                ]
              ),
        ],

        ),
      ),
  );
  }
}
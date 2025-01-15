import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:typing_text/typing_text.dart';

import '../../values/app_icons.dart';
import 'meditation_caller.dart';

class MeditationInstructions extends StatefulWidget{
  MeditationInstructions({Key? key, required this.title, required this.image_url, required this.audio_url}) : super(key: key);
  final String title;
  final String image_url;
  final String audio_url;
  @override
  State<StatefulWidget> createState() {
    return _MeditationInstructionsState();
  }

}

class _MeditationInstructionsState extends State<MeditationInstructions>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFD0D1FF),
          title: Text(widget.title, textAlign: TextAlign.center,),
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
      body : SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              Text(translate('meditate.instructions'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900, fontSize: appbar_size),),
             // TypingText(
             //            words: ['Breathe In', 'Breathe Out'],
             //            letterSpeed: Duration(milliseconds: 100),
             //            wordSpeed: Duration(milliseconds: 500),
             //            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
             //          ),

              SizedBox(height: 50,),
              Text("🌿 ${translate('meditate.title')}", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: title_size),),
              SizedBox(height: 20,),
              Text("✦ ${translate('meditate.1')}", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: button_size),),
              SizedBox(height: 15,),
              Text("✦ ${translate('meditate.2')}", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: button_size),),
              SizedBox(height: 15,),
              Text("✦ ${translate('meditate.3')}", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: button_size),),
              // SizedBox(height: 30,),
              SizedBox(height: 15,),
              Image.asset("assets/meditation_d.gif", width: 200,),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () async{
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AudioCaller(title: widget.title, image_url: widget.image_url, audio_url: widget.audio_url),
                      ),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFFD0D1FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  minimumSize: const Size(200, 50),
                  // textStyle: TextStyle(fontSize: 14),
                  shadowColor: Color(0XFFFC9EBED),
                  elevation: 5,
                ),
                child: Text(
                  translate('meditate.btn'),
                  style: TextStyle(
                    fontSize: appbar_size,
                    fontFamily: "Cooper",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 100,),
            ],
          ),
        ),
      ),

    );
  }
  
}
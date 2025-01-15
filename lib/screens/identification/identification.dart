import 'package:dipra/homepage/bottomnavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../style_.dart';
import '/widgets/360/questions.dart';
import '/widgets/question_formats/fetching_questions.dart';
import '../../widgets/question_formats/radiolisttexts.dart';
import '../../values/app_icons.dart';

class Identification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IdentificationState();
  }
}

class _IdentificationState extends State<Identification> {
  AppBar myAppBar(String title, int color){
    return (AppBar(
        backgroundColor: Color(color),
        title: Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
        centerTitle: true,
        leading: IconButton(onPressed: () async {
            await Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BottomNavigationExample(),
              ),
            );
          },
          icon: SvgPicture.asset(AppIcons.LEFTARROW,
          ),
        )
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:myAppBar(translate('identification.title'), 0XFFF5DEDE),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            MyContainer(appIcon: "location",label: translate('identification.1'), color: 0XFFFC9EBED, collection_name: 'locations',),
            // MyContainer(appIcon: AppIcons.FAMILYMEMBERS,label: 'FAMILY MEMBERS', color: 0XFFFD0D1FF, collection_name: '',),
            MyContainer(label: translate('identification.2'), color: 0XFFFC9EBED,appIcon: "daily_objects", collection_name: 'daily_object',),
            MyContainer(label: translate('identification.3'), color: 0XFFFD0D1FF,appIcon: "sound", collection_name: 'common_sounds',),
            MyContainer(label: translate('identification.4'), color: 0XFFFC9EBED,appIcon: "vegetables", collection_name: 'fruits_and_veggies',),
            // MyContainer(label: 'DATE & TIME', color: 0XFFFD0D1FF,appIcon: AppIcons.DATETIME, collection_name: 'daily_object'),
            MyContainer(label: translate('identification.5'), color:0XFFFC9EBED ,appIcon: "festival", collection_name: 'festivals'),
            MyContainer(label: translate('identification.6'), color: 0XFFFD0D1FF,appIcon: "shapes", collection_name: 'shapes_and_colors',),
            MyContainer(label: translate('identification.7'), color: 0XFFFC9EBED,appIcon: "symbols", collection_name: 'signs_and_symbols',),
            MyContainer(label: translate('identification.8'), color: 0XFFFC9EBED,appIcon: "360-view", collection_name: 'location_360',),
            SizedBox(height: 10,),
          ]
        ),
      )
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key, required this.appIcon, required this.collection_name, this.width = 200, this.height = 100, required this.label, required this.color}) : super(key: key);
  final String appIcon;
  final double width;
  final double height;
  final String label;
  final int color;
  final String collection_name;
  //final String appicons;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        showDialog(context: context,
            builder: (ctx) =>
        AlertDialog(
          title:  Text(translate('identification.dialog.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
          content:  Text(translate('identification.dialog.subtitle'), style: TextStyle(fontSize: content_size, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
          actions: <Widget> [
            Center(
              child: Column(
                children: [
                  TextButton(
                  onPressed: () {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "${collection_name}_easy", category: label, level: 'easy',)));
                  }, child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0XFFFEEC1C1),

                    ),
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                    child:  Text(translate('identification.dialog.easy'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),
                            )
                          ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "${collection_name}_intermediate", category: label, level: 'intermediate',)));

                      }, child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0XFFFEEC1C1),

                    ),
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                    child: Text(translate('identification.dialog.intermediate'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),

                  )
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => question_answers(collection_name: "${collection_name}_hard", category: label, level: 'hard',)));
                      }, child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0XFFFEEC1C1)
                    ),
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                    child:  Text(translate('identification.dialog.hard'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700)),
                  ),
                  )],
              ),
            ),

        ]
        )
        );

      },
      child: Center(
          child: Container(
        width: size.width*0.8,
        // height: size.height*0.15,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(color),
            borderRadius: BorderRadius.all(Radius.circular(23))

        ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),

      child: Row(
      children: [
        // SvgPicture.asset(appIcon, height: 60, width: 60),
        Image.asset("assets/icons_imgs/${appIcon}.png", width : 60, height : 60),
        SizedBox(width: 20,),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: para_size, fontWeight: FontWeight.w700),),
      ]
      ))),
    );
  }
}

class MyContainerTwo extends StatelessWidget {
  const MyContainerTwo(
      {Key? key, required this.appIcon, this.width = 200, this.height = 100, required this.label, required this.color})
      : super(key: key);
  final String appIcon;
  final double width;
  final double height;
  final String label;
  final int color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Center(
      child: Container(
          width: size.width * 0.85,
          // height: size.height * 0.15,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.all(Radius.circular(23))

          ),
          margin: const EdgeInsets.all(15.0),
          child: Row(
              children: [
                Image.asset("assets/icons_imgs/${appIcon}.png", width : 60, height : 60),
                SizedBox(width: 20,),
                Text(label, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: para_size),),
              ]
          )),
    );
  }
}

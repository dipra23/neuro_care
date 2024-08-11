import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/widgets/fetching_questions.dart';

import '../../radiolisttexts.dart';
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
        title: Text(title, textAlign: TextAlign.center,),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          setState(() {
            Navigator.pop(context);
          });
        },
          icon: SvgPicture.asset(AppIcons.LEFTARROW,
          ),


        )

    ));}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:myAppBar("Identitification", 0XFFF5DEDE)
      // AppBar(
      //     backgroundColor: Color(0XFFF5DEDE),
      //     title: Text("IDENTIFICATION", textAlign: TextAlign.center,),
      //     centerTitle: true,
      //     leading: IconButton(onPressed: () {
      //       setState(() {
      //         Navigator.pop(context);
      //       });
      //     },
      //       icon: SvgPicture.asset(AppIcons.LEFTARROW,
      //       ),
      //
      //
      //     )
      //
      // ),,
      ,body:SingleChildScrollView(
        child: Column(

          children: [
            MyContainer(appIcon: AppIcons.LOCATION,label: 'LOCATIONS', color: 0XFFFC9EBED, collection_name: 'locations_easy',),
            MyContainer(appIcon: AppIcons.FAMILYMEMBERS,label: 'FAMILY MEMBERS', color: 0XFFFD0D1FF, collection_name: '',),
            MyContainer(label: 'DAILY OBJECTS', color: 0XFFFC9EBED,appIcon: AppIcons.DAILYOBJECTS, collection_name: 'daily_object_easy',),
            MyContainer(label: 'SOUNDS', color: 0XFFFD0D1FF,appIcon: AppIcons.SOUNDS, collection_name: 'common_sounds_easy',),
            MyContainer(label: 'FRUITS & VEGGIES', color: 0XFFFC9EBED,appIcon: AppIcons.FRUITSVEGGIES, collection_name: 'fruits_and_veggies_easy',),
             MyContainer(label: 'DATE & TIME', color: 0XFFFD0D1FF,appIcon: AppIcons.DATETIME, collection_name: 'daily_object_hard'),
            MyContainer(label: 'FESTIVALS', color:0XFFFC9EBED ,appIcon: AppIcons.FESTIVALS, collection_name: 'festivals_easy'),
            MyContainer(label: 'SHAPES AND COLORS', color: 0XFFFD0D1FF,appIcon: AppIcons.COLOURINGBOOK, collection_name: 'shapes_and_colors_easy',),
            MyContainer(label: 'SYMBOLS', color: 0XFFFC9EBED,appIcon: AppIcons.SYMBOLS, collection_name: 'signs_and_symbols_easy',),
        
        
        
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => question_answers(collection_name: collection_name, category: label,)),
        );
      },
      child: Center(
          child: Container(
        width: size.width*0.8,
        height: size.height*0.15,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(color),
            borderRadius: BorderRadius.all(Radius.circular(23))

        ),
            margin: const EdgeInsets.all(20.0),

      child: Row(
      children: [
        SvgPicture.asset(appIcon, height: 70, width: 10),
        Text(label, textAlign: TextAlign.center,textScaler: TextScaler.linear(1.1),),

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
          width: size.width * 0.8,
          height: size.height * 0.15,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.all(Radius.circular(23))

          ),
          margin: const EdgeInsets.all(20.0),

          child: Row(
              children: [
                SvgPicture.asset(appIcon, height: 70, width: 10),
                Text(label, textAlign: TextAlign.center,
                  textScaler: TextScaler.linear(1.1),),

              ]
          )),
    );
  }
}

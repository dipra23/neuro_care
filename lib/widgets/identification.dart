import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../radiolisttexts.dart';
import '../values/app_icons.dart';

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
            MyContainer(appIcon: AppIcons.LOCATION,label: 'LOCATIONS', color: 0XFFFC9EBED),
            MyContainer(appIcon: AppIcons.FAMILYMEMBERS,label: 'FAMILY MEMBERS', color: 0XFFFD0D1FF),
            MyContainer(label: 'DAILY OBJECTS', color: 0XFFFC9EBED,appIcon: AppIcons.DAILYOBJECTS),
            MyContainer(label: 'SOUNDS', color: 0XFFFD0D1FF,appIcon: AppIcons.SOUNDS),
            MyContainer(label: 'FRUITS & VEGGIES', color: 0XFFFC9EBED,appIcon: AppIcons.FRUITSVEGGIES),
             MyContainer(label: 'DATE & TIME', color: 0XFFFD0D1FF,appIcon: AppIcons.DATETIME),
             MyContainer(label: 'FESTIVALS', color: 0XFFFC9EBED,appIcon: AppIcons.FESTIVALS),
             MyContainer(label: 'SYMBOLS', color: 0XFFFD0D1FF,appIcon: AppIcons.SYMBOLS),
        
        
        
          ]
        
        ),
      )
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key, required this.appIcon, this.width = 200, this.height = 100, required this.label, required this.color}) : super(key: key);
  final String appIcon;
  final double width;
  final double height;
  final String label;
  final int color;
  //final String appicons;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
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
    )));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../radiolisttexts.dart';
import '../values/app_icons.dart';
import 'identification.dart';

class LearnSomethingNew extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LearnSomethingNewState();
  }

}
class _LearnSomethingNewState extends State<LearnSomethingNew> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0XFFF5DEDE),
            title: Text("LEARN SOMETHING NEW", textAlign: TextAlign.center,),
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
        body: Column(

              children: [
                MyContainer(label: 'HOW TO...? DAILY ACTIVITIES', color: 0XFFFC9EBED,appIcon: AppIcons.LEFTARROW),
                MyContainer(label: 'YOUR FAMILY TREE', color: 0XFFFD0D1FF,appIcon: AppIcons.LEFTARROW),
                MyContainer(label: 'LANGUAGES', color: 0XFFFC9EBED,appIcon: AppIcons.LEFTARROW),
                MyContainer(label: 'SCENARIO BASED', color: 0XFFFD0D1FF,appIcon: AppIcons.LEFTARROW),


              ]

          ),

    );
  }
}


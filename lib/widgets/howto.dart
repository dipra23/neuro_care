import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../radiolisttexts.dart';
import '../values/app_icons.dart';
import 'identification.dart';

class HowTo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HowToState();
  }

}
class _HowToState extends State<HowTo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFF5DEDE),
          title: Text("HOW TO...? DAILY ACTIVITIES", textAlign: TextAlign.center,),
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
            MyContainer(label: 'WEAR YOUR CLOTHES', color: 0XFFFC9EBED,appIcon: AppIcons.CLOTHES),
            MyContainer(label: 'TAKE A BATH', color: 0XFFFD0D1FF,appIcon: AppIcons.BATH),
            MyContainer(label: 'COUNT MONEY', color: 0XFFFC9EBED,appIcon: AppIcons.COUNTMONEY),
            MyContainer(label: 'GO SHOPPING', color: 0XFFFD0D1FF,appIcon: AppIcons.SHOPPING),




          ]

      ),

    );
  }
}


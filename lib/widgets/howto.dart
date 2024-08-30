import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/widgets/howtopageformat.dart';

import '../radiolisttexts.dart';
import '../values/app_icons.dart';
import '../screens/identification/identification.dart';

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

    //       children: [
    //         GestureDetector
    //           (onTap: (){
    // Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => HowToPages(collection_name: "how to wear your shoes")));
    //         },
    //             child: MyContainerTwo(label: 'WEAR YOUR SHOES', color: 0XFFFC9EBED,appIcon: AppIcons.CLOTHES)),
    //         GestureDetector(
    //             onTap: (){
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => HowToPages(collection_name: "HOW TO TAKE A BATH")));
    //             },
    //             child: MyContainerTwo(label: 'TAKE A BATH', color: 0XFFFD0D1FF,appIcon: AppIcons.BATH)),
    //         GestureDetector(
    //             onTap: (){
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => HowToPages(collection_name: "HOW TO COUNT MONEY")));
    //             },
    //             child: MyContainerTwo(label: 'COUNT MONEY', color: 0XFFFC9EBED,appIcon: AppIcons.COUNTMONEY)),
    //         GestureDetector(
    //             onTap: (){
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => HowToPages(collection_name: "HOW TO GO SHOPPING")));
    //             },
    //             child: MyContainerTwo(label: 'GO SHOPPING', color: 0XFFFD0D1FF,appIcon: AppIcons.SHOPPING)),
    //
    //
    //
    //
    //       ]

      ),

    );
  }
}


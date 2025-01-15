import 'package:dipra/style_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '/widgets/howtopageformat.dart';

import '../howtopagesformat2.dart';
import 'question_formats/radiolisttexts.dart';
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
          title: Text(translate('how_to.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
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
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 15,),
              GestureDetector
                (onTap: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HowToPages2(document_name: "how to call someone")));
              },
                  child: MyContainerTwo(label: translate('how_to.call'), color: 0XFFFC9EBED,appIcon: "call")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HowToPages2(document_name: "how to use the washroom")));
                  },
                  child: MyContainerTwo(label: translate('how_to.washroom'), color: 0XFFFD0D1FF,appIcon: "bathroom")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HowToPages2(document_name: "how to take medicine")));
                  },
                  child: MyContainerTwo(label: translate('how_to.medicine'), color: 0XFFFC9EBED,appIcon: "medicines")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HowToPages2(document_name: "how to go shopping")));
                  },
                  child: MyContainerTwo(label: translate('how_to.shopping'), color: 0XFFFD0D1FF,appIcon: "grocery-store")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HowToPages2(document_name: "how to meditate")));
                  },
                  child: MyContainerTwo(label: translate('how_to.meditate'), color: 0XFFFC9EBED,appIcon: "relaxation")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HowToPages2(document_name: "how to wash your hands")));
                  },
                  child: MyContainerTwo(label: translate('how_to.hands'), color: 0XFFFD0D1FF,appIcon: "washing-hand")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HowToPages2(document_name: "how to wear shoes"))
                    );
                  },
                  child: MyContainerTwo(label: translate('how_to.shoes'), color: 0XFFFC9EBED,appIcon: "shoes")),
            ]
        ),
      ),

    );
  }
}


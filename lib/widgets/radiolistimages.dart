import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../values/app_icons.dart';
enum Options{option1, option2, option3, option4}
class RadioList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RadioListState();


  }
}
class _RadioListState extends State<RadioList>{
  Options _options= Options.option1;
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Container(
      height: size.height*0.3,
      width: size.width,
      child: GridView.count(
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        padding: EdgeInsets.all(30),
        crossAxisCount: 2,
        children: [
          ListTile(
            title: SvgPicture.asset(AppIcons.LOCATION, width: 100, height: 50,),
            leading: Radio<Options>(
              value: Options.values[0],
              groupValue: _options,
              onChanged:
                  (Options? value) {
                setState(() {
                  _options= value!;
                });


              },

            ),

          ),
          ListTile(
            title: SvgPicture.asset(AppIcons.LOCATION, width: 100, height: 50,),
            leading: Radio<Options>(
              value: Options.values[1],
              groupValue: _options,
              onChanged:
                  (Options? value) {
                setState(() {
                  _options= value!;
                });


              },

            ),

          ),
          ListTile(
            title: SvgPicture.asset(AppIcons.LOCATION, width: 100, height: 50,),
            leading: Radio<Options>(
              value: Options.values[2],
              groupValue: _options,
              onChanged:
                  (Options? value) {
                setState(() {
                  _options= value!;
                });


              },

            ),

          ),
          ListTile(
            title: SvgPicture.asset(AppIcons.LOCATION, width: 100, height: 50,),
            leading: Radio<Options>(
              value: Options.values[3],
              groupValue: _options,
              onChanged:
                  (Options? value) {
                setState(() {
                  _options= value!;
                });


              },

            ),

          )
        ],


      ),
    );


  }

  }







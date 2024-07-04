import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../values/app_icons.dart';
enum Options{option1, option2, option3, option4}
class RadioListText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RadioListTextState();


  }
}
class _RadioListTextState extends State<RadioListText>{
  Options _options= Options.option1;
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(50.0),
      height: size.height*0.3,
      width: size.width,
      child: Column(
        children: [
          ListTile(
            title: Text("Option A"),
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
            title: Text("Option B"),
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
            title: Text("Option C"),
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
            title: Text("Option D"),            leading: Radio<Options>(
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







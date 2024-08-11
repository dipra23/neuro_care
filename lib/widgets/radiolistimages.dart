import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_care/widgets/sucesspage.dart';

import '../failpage.dart';
import '../values/app_icons.dart';
class RadioList extends StatefulWidget {
  const RadioList({Key? key,required this.option0,required this.option1,
    required this.option2, required this.option3, required this.answer}) : super(key: key);
  final String option0;
  final String option1;
  final String option2;
  final String option3;
  final int answer;
  @override
  State<StatefulWidget> createState() {
    return _RadioListState();


  }
}
class _RadioListState extends State<RadioList>{
  int _options = -1;
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Container(
      // height: size.height*0.7,
      width: size.width,
      child:SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            //padding: EdgeInsets.all(30),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              ListTile(
                title: Container(
                  height: 50,
                  width: 50,
                  child: Image.network(
                            widget.option0, height: 100, width: 200,
                    ),
                ),
                leading: Radio(
                  value: 0,
                  groupValue: _options,
                  onChanged:
                      (value) {
                    setState(() {
                      _options= value!;
        
                    });
        
        
                  },
        
                ),
        
              ),
              ListTile(
                title:  Container(
                  height: 50,
                  width: 50,
                  child: Image.network(
                    widget.option1, height: 100, width: 200,
                  ),
                ),
                leading: Radio(
                  value: 1,
                  groupValue: _options,
                  onChanged:
                      (value) {
                    setState(() {
                      _options= value!;
        
                    });
        
        
                  },
        
                ),
        
              ),
              ListTile(
                subtitle:   Container(
                  height: 50,
                  width: 50,
                  child: Image.network(
                    widget.option2, height: 100, width: 200,
                  ),
                ),
                leading: Radio(
                  value: 2,
                  groupValue: _options,
                  onChanged:
                      (value) {
                    setState(() {
                      _options= value!;
                    });
        
        
                  },
        
                ),
        
              ),
              ListTile(
                title:  Container(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    widget.option3, height: 100, width: 200,
                  ),
                ),
                leading: Radio(
                  value: 3,
                  groupValue: _options,
                  onChanged:
                      ( value) {
                    setState(() {
                      _options= value!;
        
                    });
        
        
                  },
        
                ),
        
              )],
                ),
            GestureDetector(
              onTap: () {
                if (widget.answer == _options) {
        
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Congratulations()));
                } else {
        
                  {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Fail()));
                  }
                }
              },
              child: Container(
                // height: size.height * 0.05,
                alignment: Alignment.center,
                width: size.width * 0.4,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(23))),
                child: Text("SUBMIT",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),

    );


  }

  }







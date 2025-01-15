import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

import '../../values/app_icons.dart';
import '360imageplayer.dart';

class Thumbnail extends StatefulWidget {
  const Thumbnail({Key? key, required this.imageurl}) : super(key: key);
  final String imageurl;
  @override
  State<StatefulWidget> createState() {
    return ThumbNailState();
  }
}

class ThumbNailState extends State<Thumbnail> {  @override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          setState(() {
            Navigator.pop(context);
          });
        },
          icon: SvgPicture.asset(AppIcons.LEFTARROW,
          ),


        ),
        title: Text("Click arrow to go back"),

      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PanoramaView(imageurl: 'assets/360/dock.jpg',)));

          },
          child: Container(
            child: Image.asset("assets/360/dock.jpg"),
          ),
        )
      )
  );
}
}

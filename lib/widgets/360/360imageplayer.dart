import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

import '../../values/app_icons.dart';
import '../question_formats/indexUpdate.dart';

class PanoramaView extends StatefulWidget {
  const PanoramaView({Key? key, required this.imageurl}) : super(key: key);
  final String imageurl;
  @override
  State<StatefulWidget> createState() {
    return ParnoramaViewState();
  }
}

class ParnoramaViewState extends State<PanoramaView> {  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () {
            setState(() {
              index = 0;
              Navigator.pop(context);
            });
          },
            icon: SvgPicture.asset(AppIcons.LEFTARROW,
            ),
          ),
        title: Text(translate('360.back_btn')),
      ),
      body: PanoramaViewer(
        child: Image.network(widget.imageurl)
      )
    );
  }
}

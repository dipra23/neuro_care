import 'dart:async';

import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:maze/maze.dart';

import '../../../values/app_icons.dart';
import 'mazesuccess.dart';

class MazeGame extends StatefulWidget {

  const MazeGame({Key? key, required this.level}) : super(key: key);
  final String level;

  @override
  _MazeGameState createState() => _MazeGameState();
}

class _MazeGameState extends State<MazeGame> {
  @override
  Widget build(BuildContext context) {
    int col = (widget.level == "hard") ? 12 : 8 ;
    int row = (widget.level == "easy") ? 8 : 12 ;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0XFFFC9EBED),
            title: Text(translate('maze.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text(translate('maze.instructions'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: button_size),),
            Maze(
              player: MazeItem(
                'assets/maze/start.png',
                ImageType.asset
              ),
              columns: col,
              rows: row,
              height: MediaQuery.of(context).size.height - 250,
              wallThickness: 4.0,
              wallColor: Theme.of(context).primaryColor,
              finish: MazeItem(
                'assets/maze/end.png',
                ImageType.asset),
              onFinish: () {
                Timer(const Duration(seconds: 2), () async {
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => MazeSuccess(level: widget.level,)),
                  );
                });
              }
            ),
          ],
        )
      )
    );
  }
}

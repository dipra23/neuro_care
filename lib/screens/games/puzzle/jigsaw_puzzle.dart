
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jigsaw_puzzle/flutter_jigsaw_puzzle.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/screens/games/puzzle/puzzlesuccesspage.dart';
import 'package:neuro_care/widgets/sucesspage.dart';

import '../../../values/PuzzleImages.dart';
import '../../../values/app_icons.dart';
class JigSawPuzzlePage extends StatefulWidget{
   JigSawPuzzlePage({Key? key, required this.image_url, required this.gridsize}) : super(key: key);
  final String image_url;
  int gridsize;
  @override
  State<StatefulWidget> createState() {
    return _JigSawPuzzlePageState();
  }

}

class _JigSawPuzzlePageState extends State<JigSawPuzzlePage> {
  final puzzleKey = GlobalKey<JigsawWidgetState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Generate();
    });
  }

  void Generate() async {
    await puzzleKey.currentState!.generate();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(
          backgroundColor: Color(0XFFC9EBED),
          title: Text("SOLVE", textAlign: TextAlign.center,),
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
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await puzzleKey.currentState!.generate();
                    },
                    child: const Text('Generate'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      puzzleKey.currentState!.reset();
                    },
                    child: const Text('Clear'),
                  ),
                ],
              ),
              JigsawPuzzle(
                gridSize: widget.gridsize,
                image:
                    NetworkImage(widget.image_url),
                onFinished: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PuzzleCongrats(gridsize: widget.gridsize)),
                  );
                },
                // ignore: avoid_redundant_argument_values
                snapSensitivity: .5,
                // Between 0 and 1
                puzzleKey: puzzleKey,
                onBlockSuccess: () {
                  // ignore: avoid_print
                  print('block success!');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}









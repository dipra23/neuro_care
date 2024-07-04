import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neuro_care/screens/games/jigsaw_puzzle.dart';
import 'package:neuro_care/values/PuzzleImages.dart';
import 'package:neuro_care/widgets/audioplayer/audiocaller.dart';

import '../../values/app_icons.dart';
import '../../values/meditation_audios.dart';

class ChoosePuzzle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChoosePuzzleState();
  }

}


class _ChoosePuzzleState extends State<ChoosePuzzle>{
  List PuzzleNames = [ "AUTUMN SKY", "BOAT", "HARP RELAX", "NATURE", "NATURE AND PIANO", "PIANO",
    "SCOTTISH RAIN", "SPRIIT IN THE WOODS", "NIGHT SKY", "STARLIGHT", "VALLEY SUNSET", "WHISPERING WINDS"];
  List Images = [PuzzleImages.MOUNTAIN, PuzzleImages.MOUNTAIN, PuzzleImages.MOUNTAIN, PuzzleImages.MOUNTAIN, PuzzleImages.MOUNTAIN, PuzzleImages.MOUNTAIN,PuzzleImages.MOUNTAIN,PuzzleImages.MOUNTAIN,PuzzleImages.MOUNTAIN,PuzzleImages.MOUNTAIN,PuzzleImages.MOUNTAIN,PuzzleImages.MOUNTAIN];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> Tiles= [];

    myRow() {
      for (int i = 0; i < PuzzleNames.length; i++) {
        Tiles.insert(i,  GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Puzzle Level"),
                  content: const Text("please select a difficulty level"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => JigSawPuzzlePage(index: i, gridsize: 3)
                            )
                        );
                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("easy"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => JigSawPuzzlePage(index: i, gridsize: 4)
                            )
                        );
                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("medium"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => JigSawPuzzlePage(index: i, gridsize: 5)
                        )
                        );

                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("hard"),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: GridTile(

                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.pink,

                    ),
                    margin: const EdgeInsets.all(5.0),
                    child: Column(
                        children: [
                          Image.asset(
                            //height: size.height*0.05,
                            Images[i],
                            height: size.height*0.05,


                          ),
                          Spacer(),
                          Text(PuzzleNames[i],
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(1.1),),

                        ]

                    )

                )
            )
        )
        );

      }
      return Tiles;

    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFF5DEDE),
          title: Text("PUZZLES", textAlign: TextAlign.center,),
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
      body:Center(
          child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[...myRow()]





          )
      ),

    );



  }

}
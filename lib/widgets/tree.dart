import 'package:flutter/material.dart';
import 'package:graphite/graphite.dart';

void main() => runApp(MyApp());
const list = '['
    '{"id":"A","next":[{"outcome":"B"}]},'
    '{"id":"B","next":[{"outcome":"C"},{"outcome":"D"},{"outcome":"E"}]},'
    '{"id":"C","next":[{"outcome":"F"}]},'
    '{"id":"D","next":[{"outcome":"J"}]},{"id":"E","next":[{"outcome":"J"}]},'
    '{"id":"J","next":[{"outcome":"I"}]},'
    '{"id":"I","next":[{"outcome":"H"}]},{"id":"F","next":[{"outcome":"K"}]},'
    '{"id":"K","next":[{"outcome":"L"}]},'
    '{"id":"H","next":[{"outcome":"L"}]},{"id":"L","next":[{"outcome":"P"}]},'
    '{"id":"P","next":[{"outcome":"M"},{"outcome":"N"}]},'
    '{"id":"M","next":[]},{"id":"N","next":[]}'
    ']';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Graphite',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InteractiveViewer(
          constrained: false,
          child: DirectGraph(
            list: nodeInputFromJson(list),
            defaultCellSize: const Size(100.0, 100.0),
            cellPadding: const EdgeInsets.all(20),
            orientation: MatrixOrientation.Vertical,
          ),
        )
    );
  }
}
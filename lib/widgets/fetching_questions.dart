import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuro_care/widgets/languagequestion.dart';
import 'package:neuro_care/widgets/question_format_four.dart';
import 'package:neuro_care/widgets/question_format_one.dart';
import 'package:neuro_care/widgets/question_format_three.dart';
import 'package:neuro_care/widgets/question_format_two.dart';
import 'package:neuro_care/widgets/question_format_zero.dart';

import '../question_format_five.dart';

final FirebaseFirestore firestore= FirebaseFirestore.instance;






class question_answers extends StatefulWidget{
  const question_answers({Key? key, required this.collection_name, required this.category}) : super(key: key);
 final String collection_name;
 final String category;
  @override
  State<StatefulWidget> createState() {
    return _Question_AnswersState();
  }

}

class _Question_AnswersState extends State<question_answers> {
 late List data;
    late Map current_document;

  Future<Map> GetData () async {
    final collection = firestore.collection(widget.collection_name);
    QuerySnapshot all_collections= await collection.get();
    List doc_list = all_collections.docs.map((doc) => doc.data()).toList();
    doc_list.shuffle();
    data = doc_list;
    data= data.sublist(0, 4);
    current_document= data[0];
    return current_document;
  }
  // @override
  // void initState(){
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     GetData().then((value){
  //       data= data.sublist(0, 4);
  //       current_document= data[index];
  //       print(current_document.keys);
  //       setState(() {
  //
  //       });
  //     });
  //
  //   });
  //
  //
  // }
  Widget question_Format (){
    if (current_document['q_format'] == 0){
      print("0");
      return QuestionFormatZero(question: current_document['que'], option2: current_document['options']['2'],
          option3:current_document['options']['3'],  option0: current_document['options']['0'],
        option1: current_document['options']['1'], answer: current_document['ans'], category: widget.category,
      );

    }
    else if (current_document['q_format'] == 1){
      print("1");
      return QuestionFormatOne(question: current_document['que'], option2: current_document['options']['2'],
        option3:current_document['options']['3'],  option0: current_document['options']['0'],
        option1: current_document['options']['1'], answer: current_document['ans'],category: widget.category);

    }
    else if (current_document['q_format'] == 2){
      print("2");

      return QuestionFormatTwo(question: current_document['que'], option2: current_document['options']['2'],
        option3:current_document['options']['3'],  option0: current_document['options']['0'],
        option1: current_document['options']['1'], answer: current_document['ans'], url: current_document['img_url'],category: widget.category);

    }
    else if(current_document['q_format'] == 3){
      print("3");

      return QuestionFormatThree(question: current_document['que'], option2: current_document['options']['2'],
        option3:current_document['options']['3'],  option0: current_document['options']['0'],
        option1: current_document['options']['1'], answer: current_document['ans'], url: current_document['img_url'],category: widget.category);

    }
    else if(current_document['q_format'] == 4){
      print("4");

      return QuestionFormatFour(question: current_document["que"], option2:  current_document['options']['2'], option3:  current_document['options']['3'], option0:  current_document['options']['0'], 
        option1:  current_document['options']['1'], answer:  current_document['ans'], category:  "Common Sounds", url:  current_document['audio_url']
      );

    }
    else if(current_document['q_format'] == 5){
      print("5");

      return QuestionFormatFive(question: current_document["que"], option2:  current_document['options']['2'], option3:  current_document['options']['3'], option0:  current_document['options']['0'],
        option1:  current_document['options']['1'], answer:  current_document['ans'], category: 'Common Sounds', url: current_document['audio_url'],);

    }
    else if(current_document['q_format'] == 6){
      print("6");

      return Language_Format_Zero(text: current_document['text']);

    }
    else if(current_document['q_format'] == 7){
      print("7");

      return Language_Format_Zero(text: current_document['text']);

    }

    else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (ctx, snapshot){
      if(snapshot.hasData) {
        print("has data");
        return question_Format();
      }
      else if(snapshot.hasError){
        return Center(
          child: Text(
            '${snapshot.error} occurred',
            style: TextStyle(fontSize: 18),
          ),
        );
      }
      return CircularProgressIndicator();

      }

    ,future: GetData(),));
  }
}
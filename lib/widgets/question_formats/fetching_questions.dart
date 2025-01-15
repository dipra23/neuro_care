import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../360/questions.dart';
import '/values/global_variables.dart';
import '/widgets/question_formats/languagequestion.dart';
import '/widgets/question_formats/question_format_four.dart';
import '/widgets/question_formats/question_format_one.dart';
import '/widgets/question_formats/question_format_three.dart';
import '/widgets/question_formats/question_format_two.dart';
import '/widgets/question_formats/question_format_zero.dart';

import 'indexUpdate.dart';
import 'question_format_five.dart';

final FirebaseFirestore firestore= FirebaseFirestore.instance;

class question_answers extends StatefulWidget{
  const question_answers({Key? key, required this.collection_name, required this.category, required this.level}) : super(key: key);
 final String collection_name;
 final String level;
 final String category;
  @override
  State<StatefulWidget> createState() {
    return _Question_AnswersState();
  }
}

class _Question_AnswersState extends State<question_answers> {
    List data = [];
    Map current_document = {};
    int current_index = index;

  Future<List> GetData () async {
    final collection = firestore.collection(widget.collection_name);
    QuerySnapshot all_collections= await collection.get();
    List doc_list = all_collections.docs.map((doc) => doc.data()).toList();
    doc_list.shuffle();
    data = doc_list;
    data= data.sublist(0, 5);
    print("length : ${data.length}");
    current_document= data[0];
    // print(current_document);
    return data;
  }

 Widget question_Format (){
    print(current_index);
    current_document = quizData[current_index];
   if (current_document['q_format'] == 0){
     print("0");
     return QuestionFormatZero(question: current_document['que'], option2: current_document['options']['2'],
       option3:current_document['options']['3'],  option0: current_document['options']['0'],
       option1: current_document['options']['1'], answer: current_document['ans'], category: widget.category, level: widget.level, collection_name: widget.collection_name,
     );
   }
   else if (current_document['q_format'] == 1){
     print("1");
     return QuestionFormatOne(question: current_document['que'], option2: current_document['options']['2'],
         option3:current_document['options']['3'],  option0: current_document['options']['0'],
         option1: current_document['options']['1'], answer: current_document['ans'],category: widget.category, level: widget.level,collection_name: widget.collection_name);
   }
   else if (current_document['q_format'] == 2){
     print("2");

     return QuestionFormatTwo(question: current_document['que'], option2: current_document['options']['2'],
         option3:current_document['options']['3'],  option0: current_document['options']['0'],
         option1: current_document['options']['1'], answer: current_document['ans'], url: current_document['img_url'],category: widget.category, level: widget.level,collection_name: widget.collection_name);

   }
   else if(current_document['q_format'] == 3){
     print("3");

     return QuestionFormatThree(question: current_document['que'], option2: current_document['options']['2'],
         option3:current_document['options']['3'],  option0: current_document['options']['0'],
         option1: current_document['options']['1'], answer: current_document['ans'], url: current_document['img_url'],category: widget.category, level: widget.level,collection_name: widget.collection_name);

   }
   else if(current_document['q_format'] == 4){
     print("4");

     return QuestionFormatFour(question: current_document["que"], option2:  current_document['options']['2'], option3:  current_document['options']['3'], option0:  current_document['options']['0'],
         option1:  current_document['options']['1'], answer:  current_document['ans'], category:  "Common Sounds", url:  current_document['audio_url'], level: widget.level,collection_name: widget.collection_name
     );

   }
   else if(current_document['q_format'] == 5){
     print("5");

     return QuestionFormatFive(question: current_document["que"], option2:  current_document['options']['2'], option3:  current_document['options']['3'], option0:  current_document['options']['0'],
         option1:  current_document['options']['1'], answer:  current_document['ans'], category: 'Common Sounds', url: current_document['audio_url'], level: widget.level,collection_name: widget.collection_name);

   }
   else if(current_document['q_format'] == 6){
     print("6");

     return Language_Format_Zero(text: current_document['text'], level: widget.category,category: "languages",collection_name: widget.collection_name);

   }
   else if(current_document['q_format'] == 7){
     print("7");

     return Language_Format_Zero(text: current_document['text'], level: widget.category, category: "languages",collection_name: widget.collection_name, );

   }
   else if(current_document['format'] == 360){
     print("360");

     return question_answers_360(question: current_document['que'], level: widget.category, category: "location 360",collection_name: widget.collection_name, answer : current_document["ans"], option0 : current_document["options"]["0"], option1 : current_document["options"]["1"], option2 : current_document["options"]["2"], option3 : current_document["options"]["3"], image_url: current_document["img_url"], );

   }

   else{
     return Container();
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (current_index == 0) ?  FutureBuilder(
        builder: (ctx, snapshot){
      if(snapshot.hasData) {
        print("has data");
        quizData = data;
        print(quizData);
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

    ,future: GetData(),) : question_Format()
    );
  }
}
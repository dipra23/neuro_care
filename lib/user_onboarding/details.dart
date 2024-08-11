import 'package:flutter/material.dart';


class Details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DetailsState();
  }

}
class _DetailsState extends State<Details>{
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _ageController= new TextEditingController();
  @override
  Future ShowAlertDialogBox(BuildContext context){
    return showDialog (
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Authentication"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("close"))
            ],
          );
        }
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("sign up")
        ),
        body: Center(
          child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: _nameController,
                    showCursor: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter your full name")
                    ),
                    obscureText: false,
                    cursorWidth: 3,
                    // cursorHeight: 7,
                    cursorColor: Colors.orange,


                  ),


                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: _ageController,
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Age?",
                      //label: Text("Enter your password:")
                    ),
                    obscureText: false,
                    cursorWidth: 3,
                    // cursorHeight: 7,
                    cursorColor: Colors.orange,


                  ),


                ),
               GestureDetector(
                 onTap: (){
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ChooseMeditation()),
      // );
    },
                    child: Text("Continue"),)]
        )
    )
    );
  }

}
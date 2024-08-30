
import 'package:flutter/material.dart';
import 'package:neuro_care/auth/user_repository.dart';
import '../auth/user_model.dart';


class Details extends StatefulWidget{
  const Details({Key? key, required this.uid}) : super(key: key);
  final String? uid;
  @override
  State<StatefulWidget> createState() {
    return _DetailsState();
  }

}
class _DetailsState extends State<Details>{
  final  _nameController = new TextEditingController();
  final _ageController= new TextEditingController();
  final _sexController= new TextEditingController();
  final _nationality= new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _IDController = new TextEditingController();
  final _city = new TextEditingController();
  final _country = new TextEditingController();

  final userRepo= UserRepository();
  void createUser(User_Model user, String? uid) {

     userRepo.createUser(user, uid);

  }



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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: _emailController,
                      showCursor: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter your email")
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
                      controller: _passwordController,
                      showCursor: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter your password")
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
                      controller: _IDController,
                      showCursor: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter your ID")
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
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: _sexController,
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Sex?",
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
                      controller: _nationality,
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nationality?",
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
                      controller: _city,
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "What city do you live in?",
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
                      controller: _country,
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "What country do you live in?",
                      ),
                      obscureText: false,
                      cursorWidth: 3,
                      // cursorHeight: 7,
                      cursorColor: Colors.orange,


                    ),


                  ),
        GestureDetector(
                   onTap: (){
                     print("tapped");
                     final user= User_Model(
                       fullname: _nameController.text.trim(),
                       age: _ageController.text.trim(),
                       nationality: _nationality.text.trim(),
                       sex: _sexController.text.trim(),
                       Id: 'DB',
                       email: _emailController.text.trim(),
                       password: _passwordController.text.trim(),
                       city: _city.text.trim(),
                       country: _country.text.trim()

          
          
          
          
          
                     );
                  createUser(user, widget.uid);
          
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ChooseMeditation()),
                // );
              },
                      child: Container(
                        height: 100,
                          child: Text("Continue")),)]
          )
              ),
        )
    );
  }

}
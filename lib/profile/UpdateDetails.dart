
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:image_picker/image_picker.dart';
import '/auth/user_repository.dart';
import '/homepage/bottomnavigation.dart';
import '../auth/user_model.dart';


class UpdateDetails extends StatefulWidget{
  const UpdateDetails({Key? key, required this.data, required this.uid}) : super(key: key);
  final Map<dynamic, dynamic> data;
  final String uid;
  @override
  State<StatefulWidget> createState() {
    return _UpdateDetailsState();
  }

}
class _UpdateDetailsState extends State<UpdateDetails>{
  FirebaseStorage storage = FirebaseStorage.instance;
  TextEditingController  _nameController = new TextEditingController();
  TextEditingController _ageController= new TextEditingController();
  TextEditingController _sexController= new TextEditingController();
  TextEditingController _nationality= new TextEditingController();
  bool selected = false;
  bool _isLoading = false;

  final userRepo = UserRepository();
  void updateUser(User_Update_Model user, String? uid) {
     userRepo.updateUser(user, uid);
  }

  final ImagePicker _picker = ImagePicker();
   XFile? _image;

  void initState() {
    _nameController = new TextEditingController(text : widget.data["FullName"]);
    _ageController= new TextEditingController(text : widget.data["Age"]);
    _sexController= new TextEditingController(text : widget.data["Sex"]);
    _nationality= new TextEditingController(text : widget.data["Nationality"]);
  }

  Future<String> uploadImage() async {
    if (_image == null) {
      throw Exception("No image selected");
    }

    File file = File(_image!.path);
    String fileName = 'user_images/${widget.uid}/${DateTime.now().millisecondsSinceEpoch.toString()}';

    try {
      Reference ref = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      print('Uploaded Image URL: $imageUrl');
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      rethrow;
    }
  }


  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = pickedFile;
          selected = true;
        });
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
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
            title: Text(translate('onboarding.title')),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0XFFFD0D1FF), width: 4),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                     child :
                     widget.data["Image"] != null ? (widget.data["Image"].contains("https")) ? Image.network(widget.data["Image"], width:120, height: 120,) : Image.asset( "assets/old_person.png", width: 120, height: 120,) : Image.asset( "assets/old_person.png", width: 120, height: 120,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFFD0D1FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      // textStyle: TextStyle(fontSize: 14),
                      shadowColor: Color(0XFFFC9EBED),
                      elevation: 5,
                    ),
                    child: Text(translate('onboarding.image'), style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: _nameController,
                      showCursor: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(translate('onboarding.name'),)
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
                        labelText: translate('onboarding.age'),
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
                        labelText: translate('onboarding.gender'),
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
                        labelText: translate('onboarding.nationality'),
                      ),
                      obscureText: false,
                      cursorWidth: 3,
                      // cursorHeight: 7,
                      cursorColor: Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        onPressed: () async{
                          print("tapped");
                          String imageUrl= "";
                          if(selected) {
                            imageUrl = await uploadImage();
                          }
                          else{
                            imageUrl = widget.data["Image"] ?? "assets/old_person.png";
                          }
                          final user= User_Update_Model(
                            image: imageUrl,
                            fullname: _nameController.text.trim(),
                            age: _ageController.text.trim(),
                            nationality: _nationality.text.trim(),
                            sex: _sexController.text.trim(),
                          );
                          updateUser(user, widget.uid);
                          Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavigationExample()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFFD0D1FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          minimumSize: const Size(double.infinity, 50),
                          // textStyle: TextStyle(fontSize: 14),
                          shadowColor: Color(0XFFFC9EBED),
                          elevation: 5,
                        ),
                        child:
                             Text(translate('onboarding.btn'),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "Cooper",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
            ]
          )
          ),
        )
    );
  }
}
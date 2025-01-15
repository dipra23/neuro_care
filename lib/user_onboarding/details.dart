import 'dart:io';

import 'package:dipra/screens/family_members/addFamilyMembers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/mmse/mmsefirstscreen.dart';
import '/auth/user_repository.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../auth/user_model.dart';

class Details extends StatefulWidget{
  const Details({Key? key, required this.uid, required this.email}) : super(key: key);
  final String? uid, email;
  @override
  State<StatefulWidget> createState() {
    return _DetailsState();
  }
}

class _DetailsState extends State<Details>{
  FirebaseStorage storage = FirebaseStorage.instance;
  final  _nameController = new TextEditingController();
  final _ageController= new TextEditingController();
  final _sexController= new TextEditingController();
  final _nationality= new TextEditingController();

  bool _isLoading = false;

  final userRepo = UserRepository();
  void createUser(User_Model user, String? uid) {
     userRepo.createUser(user, uid);
  }

  final ImagePicker _picker = ImagePicker();
   XFile? _image;

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
        });
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Widget build(BuildContext context) {

    var localizationDelegate = LocalizedApp.of(context).delegate;

    return Scaffold(
        appBar: AppBar(
            title: Text(translate('onboarding.title'),),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
            child: _isLoading ?
            CircularProgressIndicator() :
            Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0XFFFD0D1FF), width: 4),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child :_image != null ?Image.file(File(_image!.path), width: 150, height: 150,)  : Image.asset("assets/old_person.png", width: 150, height: 150,),
                    ),
                  ),
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

                          String imageUrl = "";setState(() {
                            _isLoading = true;
                          });

                          imageUrl = _image != null ? await uploadImage() : "assets/old_person.png";
                          final user= User_Model(
                            image: imageUrl ,
                            fullname: _nameController.text.trim(),
                            age: _ageController.text.trim(),
                            nationality: _nationality.text.trim(),
                            sex: _sexController.text.trim(),
                            email: widget.email, total_points: 0, meditation: 0, hard_puzzles: 0, quizzes: 0, locations_360: 0, drawings: 0, puzzle_number: 0, current_points: 0, languages: 0, sounds: 0,
                          );
                          createUser(user, widget.uid);

                          setState(() {
                            _isLoading = false;
                          });
                          Navigator.push(context,MaterialPageRoute(builder: (context) => AddFamilyDetails(name: _nameController.text.trim(), task : "onboarding")),
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
                            Text(
                              translate('onboarding.btn'),
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
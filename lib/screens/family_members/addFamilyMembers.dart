import 'dart:async';
import 'dart:io';
import 'package:dipra/style_.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../mmse/mmsefirstscreen.dart';

class AddFamilyDetails extends StatefulWidget {
  const AddFamilyDetails({Key? key, required this.task, required this.name})
      : super(key: key);
  final String task;
  final String name;
  @override
  _AddFamilyDetailsState createState() => _AddFamilyDetailsState();
}

class _AddFamilyDetailsState extends State<AddFamilyDetails> {
  final List<FamilyMember> familyMembers = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _funFactController = TextEditingController();

  User? currentUser;
  File? _selectedImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    _loadFamilyMembers();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _relationController.dispose();
    _phoneNumberController.dispose();
    _funFactController.dispose();
    super.dispose();
  }

  Future<void> _loadFamilyMembers() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    DocumentSnapshot snapshot =
    await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();
    if (snapshot.exists) {
      var familyList = snapshot['family'] as List;
      setState(() {
        familyMembers.clear();
        familyMembers.addAll(
            familyList.map((data) => FamilyMember.fromMap(data)).toList());
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File image) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    String fileName = '${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
    try {
      final ref =
      FirebaseStorage.instance.ref().child('family_images').child(fileName);
      await ref.putFile(image);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Image upload error: $e');
      return null;
    }
  }

  Future<void> _addFamilyMember(BuildContext context) async {
    if (_nameController.text.isNotEmpty &&
        _relationController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _funFactController.text.isNotEmpty) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      String? imageUrl;
      if (_selectedImage != null) {
        imageUrl = await _uploadImage(_selectedImage!);
      }

      FamilyMember newMember = FamilyMember(
        name: _nameController.text,
        relation: _relationController.text,
        phoneNumber: _phoneNumberController.text,
        funFact: _funFactController.text,
        photoUrl: imageUrl ?? '',
      );

      setState(() {
        familyMembers.add(newMember);
        _isLoading = true;
      });

      await FirebaseFirestore.instance.collection('Users').doc(user.uid).update({
        'family': familyMembers.map((member) => member.toMap()).toList(),
      });

      // Clear the form
      _nameController.clear();
      _relationController.clear();
      _phoneNumberController.clear();
      _funFactController.clear();
      _selectedImage = null;

      setState(() {
        _isLoading = false;
      });

      Navigator.pop(context);
    }
  }

  void _showAddMemberDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(translate('family_member.add_btn'), style: TextStyle(fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
          content: SingleChildScrollView(
            child: _isLoading ?
            Center(child: CircularProgressIndicator()) :
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: _selectedImage == null
                          ? Icon(Icons.add_a_photo, size: 30)
                          : null,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: translate('family_member.name')),
                  ),
                  TextField(
                    controller: _relationController,
                    decoration: InputDecoration(labelText: translate('family_member.relation')),
                  ),
                  TextField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(labelText: translate('family_member.phone_no')),
                    keyboardType: TextInputType.phone,
                  ),
                  TextField(
                    controller: _funFactController,
                    decoration: InputDecoration(labelText: translate('family_member.fun_fact')),
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(translate('family_member.cancel_btn'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w600, color: Colors.black),),
            ),
            ElevatedButton(
              onPressed: () => _addFamilyMember(context),
              child: Text(translate('family_member.save_btn'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w700, color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFFD0D1FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5),
                minimumSize: const Size(100, 40),
                // textStyle: TextStyle(fontSize: 14),
                elevation: 5,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFD0D1FF),
        title: Text(
          translate('family_member.title'),
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        automaticallyImplyLeading: (widget.task == "update") ? true : false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/tree.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: title_size, fontWeight: FontWeight.bold),
                  ),
                  Divider(thickness: 1, height: 30),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: familyMembers.length,
                      itemBuilder: (context, index) {
                        final member = familyMembers[index];
                        return Card(
                          color: Color(0XFFFD0D1FF),
                          shadowColor: Color(0XFFFD0D1FF),
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: member.photoUrl.isNotEmpty
                                      ? NetworkImage(member.photoUrl)
                                      : null,
                                  child: member.photoUrl.isEmpty
                                      ? Icon(Icons.person, size: 30)
                                      : null,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        member.name,
                                        style: TextStyle(
                                            fontSize: button_size,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      EasyRichText(
                                        '${translate('family_member.relation')}: ${member.relation}',
                                        defaultStyle: TextStyle(fontSize: content_size),
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: '${translate('family_member.relation')}:',
                                            style: TextStyle(fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      EasyRichText(
                                        '${translate('family_member.phone')}: ${member.phoneNumber}',
                                        defaultStyle: TextStyle(fontSize: content_size),
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: '${translate('family_member.phone')}:',
                                            style: TextStyle(fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      EasyRichText(
                                        '${translate('family_member.fun_fact')}: ${member.funFact}',
                                        defaultStyle: TextStyle(fontSize: content_size),
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: '${translate('family_member.fun_fact')}:',
                                            style: TextStyle(fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      // Text(
                                      //   'Relation: ${member.relation}',
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      // Text(
                                      //   'Phone: ${member.phoneNumber}',
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      // Text(
                                      //   'Fun Fact: ${member.funFact}',
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _showAddMemberDialog,
                      child: Text(
                          translate('family_member.add_btn'),
                        style: TextStyle(
                            fontSize: button_size,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFFD0D1FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
                        minimumSize: const Size(150, 50),
                        elevation: 5,
                      ),
                    ),
                    SizedBox(height: 30,),
                    if(widget.task == "onboarding")
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () async{
                          Navigator.push(context,MaterialPageRoute(builder: (context) => MMSEfirst()),
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
                         Text(translate('family_member.continue_btn'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: appbar_size,
                            fontFamily: "Cooper",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FamilyMember {
  String name;
  String relation;
  String phoneNumber;
  String funFact;
  String photoUrl;

  FamilyMember({
    required this.name,
    required this.relation,
    required this.phoneNumber,
    required this.funFact,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'relation': relation,
      'phoneNumber': phoneNumber,
      'funFact': funFact,
      'photoUrl': photoUrl,
    };
  }

  factory FamilyMember.fromMap(Map<String, dynamic> map) {
    return FamilyMember(
      name: map['name'],
      relation: map['relation'],
      phoneNumber: map['phoneNumber'],
      funFact: map['funFact'],
      photoUrl: map['photoUrl'],
    );
  }
}

import 'dart:async';
import 'dart:io';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../style_.dart';

class FamilyTreePage extends StatefulWidget {
  @override
  _FamilyTreePageState createState() => _FamilyTreePageState();
}

class _FamilyTreePageState extends State<FamilyTreePage> {
  List<FamilyMember> familyMembers = [];
  User? currentUser;

  final List<Offset> familyMemberPositions = [
    Offset(0.3, 0.35), // 20% across, 30% down
    Offset(0.5, 0.2), // center top
    Offset(0.7, 0.4), // 70% across, 40% down
    Offset(0.4, 0.6), // bottom left
    Offset(0.6, 0.7), // bottom right
  ];

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _loadFamilyMembers();
    }
  }

  Future<void> _loadFamilyMembers() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();
    if (snapshot.exists) {
      var familyList = snapshot['family'] as List;
      setState(() {
        familyMembers = familyList.map((data) => FamilyMember.fromMap(data)).toList();
      });
    }
  }

  void _showFamilyMemberDialog(FamilyMember member) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: member.photoUrl.isNotEmpty
                    ? NetworkImage(member.photoUrl)
                    : null,
                child: member.photoUrl.isEmpty
                    ? Icon(Icons.person, size: 30)
                    : null,
              ),
              SizedBox(height: 10,),
              Text(member.name, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700),),
            ],
          ),
          content: Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyRichText(
                  '${translate('family_member.relation')}: ${member.relation}',
                  defaultStyle: TextStyle(fontSize: button_size),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '${translate('family_member.relation')}:',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                EasyRichText(
                  '${translate('family_member.phone')}: ${member.phoneNumber}',
                  defaultStyle: TextStyle(fontSize: button_size),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '${translate('family_member.phone')}:',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                EasyRichText(
                  '${translate('family_member.fun_fact')}: ${member.funFact}',
                  defaultStyle: TextStyle(fontSize: button_size),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '${translate('family_member.fun_fact')}:',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(translate('family_member.close_btn'), style: TextStyle(fontSize: button_size, fontWeight: FontWeight.w500),),
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
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Image.asset(
                  'assets/tree.png',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 2,
                ),
              ),
            ),
            if (familyMembers.isNotEmpty)
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxPositions = familyMemberPositions.length;
                    final extraMembers = familyMembers.skip(maxPositions).toList();
                    return Stack(
                      children: [
                        for (int i = 0; i < familyMembers.length && i < maxPositions; i++)
                          Positioned(
                            left: constraints.maxWidth * familyMemberPositions[i].dx,
                            top: constraints.maxHeight * familyMemberPositions[i].dy,
                            child: GestureDetector(
                              onTap: () => _showFamilyMemberDialog(familyMembers[i]),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: familyMembers[i].photoUrl.isNotEmpty
                                        ? NetworkImage(familyMembers[i].photoUrl)
                                        : AssetImage('assets/placeholder.png') as ImageProvider,
                                    radius: 40,
                                  ),
                                  SizedBox(height: 7,),
                                  Text(
                                    familyMembers[i].name,
                                    style: TextStyle(fontSize: content_size, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Column(
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: extraMembers.map((member) {
                                    return GestureDetector(
                                      onTap: () => _showFamilyMemberDialog(member),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: member.photoUrl.isNotEmpty
                                                ? NetworkImage(member.photoUrl)
                                                : AssetImage('assets/placeholder.png') as ImageProvider,
                                            radius: 25,
                                          ),
                                          Text(
                                            member.name,
                                            style: TextStyle(fontSize: content_size, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          ],
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
      photoUrl: map['photoUrl'] ?? '',
    );
  }
}

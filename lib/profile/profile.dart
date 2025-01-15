import 'package:dipra/style_.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../auth/login_email.dart';
import '../screens/family_members/addFamilyMembers.dart';
import '../screens/mmse/mmse_score_history.dart';
import '../widgets/question_formats/indexUpdate.dart';
import 'About_US.dart';
import 'Contact_us.dart';
import 'ProfileMenuWidget.dart';
import 'UpdateDetails.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profile> {
  final FirebaseFirestore firestore= FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  List data = [];

  Future<List> getData() async {
    DocumentReference docRef = FirebaseFirestore.instance.collection("Users").doc(user?.uid);
    DocumentSnapshot snapshot = await docRef.get();
    Object? fieldValue = snapshot.data();
    data.add(fieldValue);
    print("s $data");
    return data;
  }

  int selectedLanguage = (language_ == "en_US") ? 0 : 1; // 0 = English, 1 = Hindi

  void _onLanguageChange(int selected) {
    setState(() {
      selectedLanguage = selected;
    });

    if (selected == 0) {
      // Commands for English
      print("English selected");
      language_ = "en_US";
      changeLocale(context, 'en_US');
      // Add more commands for setting English language
    } else {
      // Commands for Hindi
      print("Hindi selected");
      language_ = "hi";
      changeLocale(context, 'hi');
      // Add more commands for setting Hindi language
    }
  }
  // Future<List> getData () async {
  //   final collection = firestore.collection("Users");
  //   QuerySnapshot all_collections= await collection.get();
  //   List doc_list = all_collections.docs.map((doc) => doc.data()).toList();
  //   doc_list.shuffle();
  //   data = doc_list;
  //   print("length : ${data}");
  //   return data;
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFFD0D1FF),
          title: Text(translate('profile.title'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: appbar_size),),
          centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            Map<String, dynamic> data = snapshot.data![0];
            print("data : $data");
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    // SizedBox(height: 50,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                        ),
                        color: Color(0XFFFD0D1FF),
                        border: Border.all(
                          width: 3,
                          color: Color(0XFFFD0D1FF),
                          style: BorderStyle.solid,
                        ),
                      ),
                      padding: const EdgeInsets.all(30),
                      width: double.infinity,
                      child : Column(
                        children: [
                          data["Image"] != null ? (data["Image"].contains("https")) ? Image.network(data["Image"], width:120, height: 120,) : Image.asset( "assets/old_person.png", width: 120, height: 120,) : Image.asset( "assets/old_person.png", width: 120, height: 120,),
                          const SizedBox(height: 10),
                          Text(
                            data["FullName"] != null ? data["FullName"] : "",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Color(0xFF887BB0)
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => UpdateDetails(data : data, uid : user!.uid),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF887BB0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 50),
                              // shadowColor: Color(0xFFF4B9B8),
                              elevation: 5,
                            ),
                            child: Text(
                              translate('profile.edit'),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Cooper",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          // const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    AnimatedToggleSwitch<int>.rollingByHeight(
                      height: 50.0,
                      current: selectedLanguage,
                      values: const [0, 1],
                      onChanged: (i) => _onLanguageChange(i),
                      iconBuilder: languageIconBuilder,
                      indicatorSize: const Size.fromWidth(2),
                      borderWidth: 2.0,
                      styleBuilder: (i) => ToggleStyle(
                        backgroundColor: Colors.white ,
                        indicatorColor: Color(0xFF887BB0).withOpacity(0.9),
                        borderRadius:  BorderRadius.circular(50.0),
                        indicatorBorderRadius: BorderRadius.circular(50.0),
                      ),
                      // colorBuilder: (i) => i == 0 ? Colors.blueAccent : Colors.green,
                    ),
                    SizedBox(height: 20,),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                      child:
                      ProfileMenuWidget(
                        title: translate('profile.family_members'),
                        icon: Icons.info,
                        onPress: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddFamilyDetails(name: data["FullName"] ?? "User", task: "update"),
                            ),
                          );
                        }
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                      child:
                      ProfileMenuWidget(
                          title: translate('profile.mmse_test_scores'),
                          icon: Icons.info,
                          onPress: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MMSE_Score(),
                              ),
                            );
                          }
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                      child:
                      ProfileMenuWidget(
                          title: translate('profile.about'), icon: Icons.info,
                          onPress: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AboutUsScreen(),
                              ),
                            );
                          }
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                      child:
                      ProfileMenuWidget(
                          title: translate('profile.contact'),
                          icon: Icons.perm_contact_cal,
                          onPress: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ContactUsScreen(),
                              ),
                            );
                          }
                      ),
                    ),
                    // const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ProfileMenuWidget(
                          title: translate('profile.logout'),
                          icon: Icons.logout,
                          textColor: Colors.red,
                          endIcon: false,
                          onPress: () async {
                            FirebaseAuth.instance.signOut();
                            print('Logged out');
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => emailLogin(),
                              ),
                            );
                          }
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget languageIconBuilder(int value, bool foreground) {
    final String language = value == 0 ? translate('profile.english') : translate('profile.hindi');
    final Color color = foreground ? Colors.white : Colors.black;
    return Center(
      child: Text(
        language,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
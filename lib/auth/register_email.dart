import 'dart:async';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:validation_textformfield/validation_textformfield.dart';
import 'package:dipra/auth/register_email.dart';
import '../homepage/bottomnavigation.dart';
import '../user_onboarding/details.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../widgets/question_formats/indexUpdate.dart';
import 'login_email.dart';

class emailRegister extends StatefulWidget {

  @override
  State<emailRegister> createState() => _emailRegisterState();
}

class _emailRegisterState extends State<emailRegister> {
  TextEditingController? emailController, passwordController, confirmPasswordController;
  double screenHeight = 0;
  double screenWidth = 0;
  bool isObscure = true;
  bool showvalue = false;

  final FirebaseFirestore firestore= FirebaseFirestore.instance;
  ValueNotifier userCredential = ValueNotifier('');

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

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  Future<void> CheckData(BuildContext context, String email ) async {
    User? user = FirebaseAuth.instance.currentUser;
    String? uid = user?.uid;
    final collection= firestore.collection("Users");
    DocumentSnapshot<Map<String, dynamic>> doc = await collection.doc(uid).get();
    print(doc.exists);
    if(doc.exists){
      if(doc["FullName"] != null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationExample())) ;
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(uid:uid, email: email,))) ;
      }
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => Details(uid:uid, email: email,))) ;
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: AnimatedToggleSwitch<int>.rollingByHeight(
                      height: 40.0,
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
                  ),
                  SizedBox(
                    height: screenHeight * 0.025,
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: SvgPicture.asset(AppIcons.NEUROCARE
                  //   ),
                  // ),
                  const SizedBox(height: 20,),
                  Text(
                    translate('register.title'),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 30, fontFamily: "Cooper", fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  EmailValidationTextField(
                    whenTextFieldEmpty: translate('register.email.empty_tf'),
                    validatorMassage: translate('register.email.validator_msg'),
                    decoration: InputDecoration(
                        labelText: translate('register.email.label'),
                        labelStyle: TextStyle(
                          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500,
                          fontFamily: "Cooper",
                          fontStyle: FontStyle.normal,
                        ),
                        prefixIcon: Icon(Icons.email_rounded, color: Colors.black,),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFFD0D1FF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFFD0D1FF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFFD0D1FF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        counterText: '',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 18.0)
                    ),
                    textEditingController: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height : 20),
                  PassWordValidationTextFiled(
                    lineIndicator:false,
                    passwordMinError: translate('register.password.pMinError'),
                    hasPasswordEmpty: translate('register.password.empty_pw'),
                    passwordMaxError: translate('register.password.pMaxError'),
                    passWordUpperCaseError: translate('register.password.pUCError'),
                    passWordDigitsCaseError: translate('register.password.pDCError'),
                    passwordLowercaseError: translate('register.password.pLCError'),
                    passWordSpecialCharacters: translate('register.password.pSpecialCharacters'),
                    obscureText: isObscure,
                    scrollPadding: const EdgeInsets.only(left: 60),
                    // onChanged: (value) {
                    //   // print(value);
                    // },
                    passTextEditingController: passwordController,
                    passwordMaxLength: 12,
                    passwordMinLength: 6,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: translate('register.password.label'),
                        labelStyle: TextStyle(
                          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500,
                          fontFamily: "Cooper",
                          fontStyle: FontStyle.normal,
                        ),
                        prefixIcon: Icon(Icons.password_outlined, color: Colors.black,),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFFD0D1FF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFFD0D1FF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFFD0D1FF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        counterText: '',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 18.0)
                    ),
                  ),
                  const SizedBox(height : 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(
                        value: this.showvalue,
                        checkColor: Colors.white,
                        activeColor: Color(0XFFFD0D1FF),
                        onChanged: (bool? value) {
                          setState(() {
                            this.showvalue = value!;
                            isObscure = !value;
                            print(passwordController?.text);
                          });
                        },
                      ),
                      Text(
                        translate('register.password.showPw'),
                        style: TextStyle(
                            color: Color(0xFF2F2F2F),
                            fontSize: 16,
                            fontFamily: "Cooper",
                            fontStyle: FontStyle.normal,
                           ),
                      ),
                    ],
                  ),
                  SizedBox(height : 20),
                  ConfirmPassWordValidationTextFromField(
                    obscureText: isObscure,
                    // obscureText: _isObscure,
                    scrollPadding: EdgeInsets.only(left: 60),
                    // onChanged: (value) {
                    // // print(value);
                    // },
                    whenTextFieldEmpty: translate('register.confirm_pw.empty_tf'),
                    validatorMassage: translate('register.confirm_pw.validator_msg'),
                    confirmtextEditingController: confirmPasswordController,
                    decoration: InputDecoration(
                        labelText: translate('register.confirm_pw.label'),
                        labelStyle: TextStyle(
                          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500,
                          fontFamily: "Cooper",
                          fontStyle: FontStyle.normal,
                        ),
                        prefixIcon: Icon(Icons.password_rounded, color: Colors.black,),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFFD0D1FF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFFD0D1FF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFFD0D1FF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        counterText: '',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 18.0)
                    ),
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () async{

                      print(emailController!.text);
                      print(passwordController!.text);

                      showDialog(context: context, builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });

                      try {
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController!.text,
                          password: passwordController!.text,
                        );

                        User? user = FirebaseAuth.instance.currentUser;

                        Navigator.pop(context);

                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Details(uid:user?.uid, email: emailController!.text,),
                          ),
                        );

                      } on FirebaseAuthException catch (e) {
                        Navigator.pop(context);
                        print(e.code);
                      }
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
                    child: Text(
                      translate('register.title'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "Cooper",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height : 20),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Divider(
                          color: Color(0XFFFD0D1FF),
                          thickness: 2,
                          height: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          translate('register.or'),
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Cooper",
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Divider(
                          color: Color(0XFFFD0D1FF),
                          thickness: 2,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: () async{
                        dynamic data = await signInWithGoogle();
                        print(data);
                        CheckData(context, data.user.email);
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BottomNavigationExample(),
                          ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/google_icon.png", width: 30, height: 30,),
                          SizedBox(width: 10,),
                          Text(
                            translate('register.google'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "Cooper",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                  ),
                  const SizedBox(height: 30,),
                  InkWell(
                    onTap: () async{
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => emailLogin(),
                        ),
                      );
                    },
                    child:
                    Text(
                      translate('register.login'),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontFamily: "Cooper",
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
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


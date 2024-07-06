import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:neuro_care/auth/profilepage.dart';
import 'signin.dart';
import 'package:neuro_care/main.dart';

class SignInPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignInPage();
  }

}

class _SignInPage extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  Visibility(
                    visible: constraints.maxWidth >= 1200,
                    child: Expanded(
                      child: Container(
                        height: double.infinity,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Firebase Auth Desktop',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth >= 1200
                        ? constraints.maxWidth / 2
                        : constraints.maxWidth,
                    child: StreamBuilder<User?>(
                      stream: auth.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return const ProfilePage();
                        }
                        return const AuthGate();
                      },
                    ),
                  ),
                ],
              );
            }
        )
    );
  }
}


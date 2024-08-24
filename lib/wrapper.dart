import 'package:farmeasy_v1/homepage.dart';
import 'package:farmeasy_v1/login.dart';
import 'package:farmeasy_v1/verifyemail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return HomePage();
              if (snapshot.data!.emailVerified) {
                return HomePage();
              } else {
                return VerifyEmail();
              }
            } else {
              return Login();
            }
          }),
    );
  }
}

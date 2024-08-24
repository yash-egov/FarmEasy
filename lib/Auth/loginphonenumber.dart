import 'package:farmeasy_v1/Auth/otppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPhoneNumber extends StatefulWidget {
  const LoginPhoneNumber({super.key});

  @override
  State<LoginPhoneNumber> createState() => _LoginPhoneNumberState();
}

class _LoginPhoneNumberState extends State<LoginPhoneNumber> {
  TextEditingController phonenumber = TextEditingController();

  sendcode() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91' + phonenumber.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String vid, int? token) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OTPpage(
                      vid: vid,
                    )),
          );
        },
        codeAutoRetrievalTimeout: (vid) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Text("Your Phone |"),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6)),
          SizedBox(
            height: 20,
          ),
          phonetext(),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () => (sendcode()), child: Text("Recieve OTP"))
        ],
      ),
    );
  }

  Widget phonetext() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          controller: phonenumber,
        ));
  }
}

import 'package:farmeasy_v1/Auth/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPpage extends StatefulWidget {
  final String vid;
  const OTPpage({super.key, required this.vid});

  @override
  State<OTPpage> createState() => _OTPpageState();
}

class _OTPpageState extends State<OTPpage> {
  var code = '';
  @override
  Widget build(BuildContext context) {
    signIn() async {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.vid, smsCode: code);

      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Wrapper()),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text("OTP sent successfully"),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6)),
            SizedBox(
              height: 20,
            ),
            textcode(),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
                onPressed: (() {
                  signIn();
                }),
                child: Text("Verify"))
          ],
        ),
      ),
    );
  }

  Widget textcode() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Pinput(
          length: 6,
          onChanged: (value) {
            setState(() {
              code = value;
            });
          },
        ),
      ),
    );
  }
}

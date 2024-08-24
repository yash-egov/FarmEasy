import 'package:farmeasy_v1/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  void initState() {
    sendverifylink();
    super.initState();
  }

  sendverifylink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text('Email Verification Link Send , Please check Your E-Mail'),
            backgroundColor: Colors.green,
          ))
        });
  }

  reload() async {
    await FirebaseAuth.instance.currentUser!.reload().then((value) => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Wrapper()),
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Verification"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Text(
                "Check Your Email and click on the link to verify your email , once verified click on reload button"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() => reload()),
          child: Icon(Icons.restart_alt_rounded),
        ));
  }
}

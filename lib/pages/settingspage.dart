import 'package:farmeasy_v1/Auth/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final user = FirebaseAuth.instance.currentUser!;

  signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Wrapper()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.amber,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Container(
              margin: EdgeInsets.only(
                      bottom: 20, left: MediaQuery.sizeOf(context).width) /
                  5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 40,
                    minRadius: 20,
                    backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/b/bd/Doraemon_character.png',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      if (user.displayName != null) Text(user.displayName!),
                      if (user.email != null) Text(user.email!),
                      if (user.phoneNumber != null) Text(user.phoneNumber!)
                    ],
                  )
                ],
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("About"),
                      Icon(Icons.info),
                    ],
                  ),
                ),
                onPressed: () {}),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Edit Profile"),
                      Icon(Icons.edit),
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Settings"),
                      Icon(Icons.settings),
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Report"),
                      Icon(Icons.report),
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () => signOut(),
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Log out"),
                      Icon(Icons.logout),
                    ],
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Text(
              "Made With Maggie For Framers",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}

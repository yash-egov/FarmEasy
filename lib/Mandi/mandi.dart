import 'package:farmeasy_v1/Mandi/todaysmandi.dart';
import 'package:farmeasy_v1/pages/comingsoon.dart';
import 'package:flutter/material.dart';

class MandiPage extends StatefulWidget {
  const MandiPage({super.key});

  @override
  State<MandiPage> createState() => _MandiPageState();
}

class _MandiPageState extends State<MandiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mandi"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TodaysMandi()));
                  },
                  child: Text("Today's Mandi")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ComingSoon()));
                  },
                  child: Text("All Time Mandi"))
            ],
          ),
        ),
      ),
    );
  }
}

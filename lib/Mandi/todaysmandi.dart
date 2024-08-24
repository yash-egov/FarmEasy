import 'package:flutter/material.dart';

class TodaysMandi extends StatefulWidget {
  const TodaysMandi({super.key});

  @override
  State<TodaysMandi> createState() => _TodaysMandiState();
}

class _TodaysMandiState extends State<TodaysMandi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Mandi"),
      ),
    );
  }
}

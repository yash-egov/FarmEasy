import 'package:farmeasy_v1/Mandi/mandi.dart';
import 'package:farmeasy_v1/Products/products.dart';
import 'package:farmeasy_v1/Weather/weather.dart';
import 'package:farmeasy_v1/news/news.dart';
import 'package:farmeasy_v1/pages/comingsoon.dart';
import 'package:farmeasy_v1/pages/settingspage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.green,
        leading: const Icon(
          Icons.agriculture,
          color: Colors.deepOrange,
          size: 30,
        ),
        title: Container(
          margin: EdgeInsets.only(left: 40),
          child: const Text(
            "FarmEasy",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: Icon(Icons.account_circle))
        ],
      ),
      body: Center(
        child: Text("Welcome To FarmEasy"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green, // Change this color
        unselectedItemColor: Colors.grey,

        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              label: 'Weather',
              icon: IconButton(
                onPressed: () {
                  _onItemTapped(0);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherPage()),
                  );
                },
                icon: Icon(Icons.cloud_circle),
              )),
          BottomNavigationBarItem(
            label: 'Mandi',
            icon: IconButton(
              onPressed: () {
                _onItemTapped(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MandiPage()),
                );
              },
              icon: Icon(Icons.store_mall_directory),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Post',
            icon: IconButton(
                onPressed: () {
                  _onItemTapped(2);
                },
                icon: Icon(Icons.add)),
          ),
          BottomNavigationBarItem(
            label: 'Products',
            icon: IconButton(
                onPressed: () {
                  _onItemTapped(3);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductsPage()),
                  );
                },
                icon: Icon(Icons.shop)),
          ),
          BottomNavigationBarItem(
            label: 'News',
            icon: IconButton(
                onPressed: () async {
                  _onItemTapped(4);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsPage()),
                  );
                },
                icon: Icon(Icons.newspaper)),
          ),
        ],
      ),
    );
  }
}

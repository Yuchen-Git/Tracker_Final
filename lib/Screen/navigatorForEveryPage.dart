import 'package:flutter/material.dart';
import '../main.dart';
import 'loginPage.dart';
import '../list.dart';
import '../userProfile.dart';
import 'DemoLoginPage.dart';
import 'Screen_Calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';


class PageNavi extends StatefulWidget {
  const PageNavi({super.key});


  @override
  State<PageNavi> createState() => _PageNaviState();
}

class _PageNaviState extends State<PageNavi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventListPage()),
                    );
                  },
                  child: const Text('EventListPage'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => userProfilePage()),
                    );
                  },
                  child: const Text('userProfilePage'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirebaseAuthPage()),
                    );
                  },
                  child: const Text('FirebaseAuthPage'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventListPage()),
                    );
                  },
                  child: const Text('EventListPage'),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

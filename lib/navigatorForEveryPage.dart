import 'package:flutter/material.dart';
import 'main.dart';
import 'Screen/loginPage.dart';
import 'list.dart';
import 'userProfile.dart';
import 'Screen/DemoLoginPage.dart';



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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text('LoginPage'),
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
                      MaterialPageRoute(builder: (context) => ListViewPage()),
                    );
                  },
                  child: const Text('ListViewPage'),
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

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'main.dart';
import 'loginPage.dart';
import 'list.dart';
import 'userProfile.dart';



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
                  child: const Text('Login'),
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
                  child: const Text('List'),
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
                  child: const Text('Profile'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

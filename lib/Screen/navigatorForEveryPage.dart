import 'package:flutter/material.dart';
import 'Page_EventsList.dart';
import 'Page_AuthLogin.dart';


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
              ],
            ),
          ),


        ],
      ),
    );
  }
}

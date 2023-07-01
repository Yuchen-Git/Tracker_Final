import 'package:flutter/material.dart';
import '../main.dart';
import '../list.dart';
import '../navigatorForEveryPage.dart';


class FirebaseAuthPage extends StatefulWidget {
  const FirebaseAuthPage({super.key});

  @override
  State<FirebaseAuthPage> createState() => _FirebaseAuthPageState();
}

class _FirebaseAuthPageState extends State<FirebaseAuthPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          //logo picture
          Expanded(
            flex: 35,
            child: Container(
              margin: const EdgeInsets.only(top: 50, bottom: 50),
              child: Center(
                  child: Image(
                    image: NetworkImage('https://www.graystep.com/asbworks/assets/eventtrackerlogo.png'),
                  )
              ),
            ),
          ),
          //textfields for username and password
          Expanded(
            flex: 35,
            child: Container(
              margin: const EdgeInsets.only(left: 40, right: 40),

              child: Column(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username/Email',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //login button
          Expanded(
            flex: 30,
            child: Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page')),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  //need to delete after done testing the app,
                  //because this is only take you to the page navigator
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PageNavi()),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PageNavi()),
                        );
                      },
                      child: const Text('PageNavi'),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

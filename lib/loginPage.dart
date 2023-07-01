import 'package:flutter/material.dart';
import 'main.dart';
import 'list.dart';
import 'navigatorForEveryPage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          //logo picture
          Expanded(
            flex: 35,
            child: Center(
                child: Image(
                  image: NetworkImage('https://www.graystep.com/asbworks/assets/eventtrackerlogo.png'),
                )
            ),
          ),
          //textfields for username and password
          Expanded(
            flex: 35,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),

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
              margin: const EdgeInsets.only(left: 100, right: 100),
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
                      child: const Text('Back'),
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

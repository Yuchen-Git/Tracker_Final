import 'package:flutter/material.dart';
import '../main.dart';
import '../list.dart';
import 'navigatorForEveryPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthPage extends StatefulWidget {
  const FirebaseAuthPage({super.key});

  @override
  State<FirebaseAuthPage> createState() => _FirebaseAuthPageState();
}

class _FirebaseAuthPageState extends State<FirebaseAuthPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username/Email',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: passwordController,
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
                        FirebaseAuth.instance.signInWithEmailAndPassword(email: usernameController.text, password: passwordController.text).then((value) {
                          print("Successfully login the user !");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PageNavi()),
                          );
                        }).catchError((error) {
                              print("Failed to login the user !");
                              print(error.toString());
                            });
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  //need to delete after done testing the app,
                  //because this is only take you to the page navigator
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        //sign up a user and save to firebase auth service
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: usernameController.text, password: passwordController.text)
                            .then((value) => print("Successfully sign up the user !"))
                            .catchError((error) {
                              print("Failed to sign up the user !");
                              print(error.toString());
                            });
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

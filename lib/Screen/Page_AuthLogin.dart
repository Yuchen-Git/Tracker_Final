import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Page_EventsList.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthPage extends StatefulWidget {
  const FirebaseAuthPage({super.key});

  @override
  State<FirebaseAuthPage> createState() => _FirebaseAuthPageState();
}

class _FirebaseAuthPageState extends State<FirebaseAuthPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String loginMessage = "Please enter your username and password";

  void setLoginMessage(String message) {
    setState(() {
      loginMessage = message;
    });
  }

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
            flex: 45,
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
                  Expanded(
                    child: Text(
                      loginMessage,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.red,),
                      ),
                    ),
                ],
              ),
            ),
          ),
          //login button
          Expanded(
            flex: 20,
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
                            MaterialPageRoute(builder: (context) => const EventListPage()),
                          );
                        }).catchError((error) {
                              print("Failed to login the user !");
                              print(error.toString());
                              setLoginMessage("Username/Password incorrect !! Please Re-enter");
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
                            .then((value) {
                          print("Successfully sign up the user !");
                          setLoginMessage("Successfully sign up the user !");
                          //create a new databased for the newly added user
                          FirebaseFirestore.instance.collection('users').doc(usernameController.text).set({
                          });
                          setLoginMessage("Successfully create a new database for the user !");

                        })
                            .catchError((error) {
                              print("Failed to sign up the user !");
                              print(error.toString());
                              setLoginMessage('Failed to sign up the user !\n' + 'Possible Reason: \n' + '\t\t\t\t\t\t\t\t'+ error.toString());
                            });
                      },
                      child: const Text('Sign Up'),
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

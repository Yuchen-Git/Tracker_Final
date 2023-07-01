import 'package:flutter/material.dart';

class userProfilePage extends StatefulWidget {
  const userProfilePage({super.key});

  @override
  State<userProfilePage> createState() => _userProfilePageState();
}

class _userProfilePageState extends State<userProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: Image(
                        image: NetworkImage('https://www.graystep.com/asbworks/assets/eventtrackerlogo.png')
                    ),
                  )

                ],
              ),
            ),
            Expanded(
              flex: 65,
              child: Column(
                children: [

                ],
              ),
            ),
            Expanded(
              flex: 25,
              child: Row(
                children: [

                ],
              ),
            ),

          ],
        )

    );
  }
}

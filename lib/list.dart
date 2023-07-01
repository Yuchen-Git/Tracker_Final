import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
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
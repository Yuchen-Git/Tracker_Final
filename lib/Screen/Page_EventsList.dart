import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Page_CalendarScreen.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({Key? key}): super(key: key);

  @override
  State<EventListPage> createState() => _EventListPageState();
}


class _EventListPageState extends State<EventListPage> {
  List<Map<String, dynamic>> eventList = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> _countDocuments() async {
    final CollectionReference collectionRef = _firestore.collection('events');
    QuerySnapshot querySnapshot = await collectionRef.get();
    final allDocs = querySnapshot.docs;
    return allDocs.length;
  }

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  void _loadEvents() async {
    QuerySnapshot query = await _firestore.collection('events').get();
    setState(() {
      eventList = query.docs.map((doc) => {'id': doc.id, 'name': doc['name']}).toList();
    });
  }

  void _showAddEventDialog() {
    TextEditingController controller = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add new event'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Enter event name"),
            ),
            actions: [
              TextButton(
                child: const Text('Add'),
                onPressed: () async {
                  if(controller.text.isNotEmpty) {
                    NavigatorState navigator = Navigator.of(context);

                    try {
                      DocumentReference ref = await _firestore.collection('events').add({
                        'name': controller.text,
                      });
                      setState(() {
                        eventList.add({'id': ref.id, 'name': controller.text});
                      });
                      navigator.pop();
                    } catch(e) {
                      print('Error occurred while adding event: $e');
                    }
                  } else {
                    print('Event name cannot be empty');
                  }
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Events'),
      ),
      body: FutureBuilder<int>(
        future: _countDocuments(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.event),
                  dense: true,
                  selected: true,
                  //delete event by long press
                  onLongPress: () async {
                    try {
                      await _firestore.collection('events').doc(eventList[index]['id']).delete();
                      setState(() {
                        eventList.removeAt(index);
                      });
                    } catch(e) {
                      print('Error occurred while deleting event: $e');
                    }
                  },
                  trailing: const Icon(Icons.delete),
                  title: Text(eventList[index]['name'] ?? 'Event name not found'),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalendarScreen(eventName:eventList[index]['name'], eventId:eventList[index]['id']
                        ),
                      ),
                    );
                  }



                );
              },
            );
          }
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   child: Container(height: 60.0,),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEventDialog,
        tooltip: 'Add Event',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

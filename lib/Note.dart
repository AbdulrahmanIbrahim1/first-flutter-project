// import 'package:flutter/material.dart';
//
// // import 'package:flutter/widgets.dart';
// import 'package:flutter_application_1/add_note.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class NoteApp extends StatefulWidget {
//   const NoteApp({super.key});
//
//   @override
//   State<NoteApp> createState() => _NoteAppState();
// }
//
// class _NoteAppState extends State<NoteApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 100,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Container(
//                   child: Text(
//                     'Note',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(30),
//                 child: ListView(
//                   shrinkWrap: true,
//                   children: [
//                     Notepad('Sunday', 'Go to School'),
//                     Notepad('Monday', 'go to market'),
//                     Notepad('Monday', 'go to market'),
//                     Notepad('Monday', 'go to market'),
//                     Notepad('Monday', 'go to market'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => (AddNotePage())));
//         },
//         backgroundColor: Colors.white,
//         child: Icon(
//           Icons.add,
//           size: 30,
//           color: Colors.red,
//         ),
//       ),
//     );
//   }
//
//   Widget Notepad(String title, String discription) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Container(
//         height: 150,
//         width: 100,
//         decoration: BoxDecoration(
//             color: Colors.red, borderRadius: BorderRadius.circular(20)),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(discription,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//

//=============================================================================

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  List<String> myData = [];

  void getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    myData = pref.getStringList("note") ?? [];
    setState(() {});
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Note App",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: FirebaseAuth.instance.signOut,
              icon: Icon(
                Icons.logout_rounded,
                size: 35,
                color: Colors.red,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            if (myData.isEmpty)
              Center(
                child: Text(
                  'No notes available',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     MaterialButton(
            //         onPressed: FirebaseAuth.instance.signOut,
            //         child: Container(
            //           height: 40,
            //           width: 100,
            //           child: Center(
            //             child: Text(
            //               "Sign out",
            //               style: TextStyle(
            //                   fontSize: 20,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //           decoration: BoxDecoration(
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.black12,
            //                   blurRadius: 2,
            //                   // spreadRadius: ,
            //                   offset: Offset(
            //                     -2,
            //                     2,
            //                   ),
            //                 )
            //               ],
            //               borderRadius: BorderRadius.circular(
            //                 20,
            //               ),
            //               color: Colors.red),
            //         )),
            //   ],
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: ListView.builder(
                    itemCount: myData.length,
                    itemBuilder: (context, i) {
                      return Notepad(myData[i], i);
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          ).then((value) => getData());
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget Notepad(String description, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          final SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          List<String> notes = pref.getStringList('note') ?? [];
                          notes.removeAt(index);
                          await pref.setStringList('note', notes);
                          getData();
                        },
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNotePage(
                                description: description,
                                index: index,
                                updateNote: (newDescription) async {
                                  final SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  List<String> notes =
                                      pref.getStringList('note') ?? [];
                                  notes[index] = newDescription;
                                  await pref.setStringList('note', notes);
                                  getData();
                                },
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditNotePage extends StatelessWidget {
  final String description;
  final int index;
  final Function(String) updateNote;

  EditNotePage({
    required this.description,
    required this.index,
    required this.updateNote,
  });

  final TextEditingController contr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    contr.text = description;

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Edit Note',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: contr,
              maxLines: 10,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Edit your note here...',
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateNote(contr.text);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

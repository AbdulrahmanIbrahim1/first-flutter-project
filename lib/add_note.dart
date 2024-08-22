import 'package:flutter/material.dart';

// import 'package:new_app/Note.dart';
import 'package:flutter_application_1/Note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNotePage extends StatelessWidget {
  // delete this
  // const AddNotePage({super.key});

  TextEditingController cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
      backgroundColor: Colors.blue,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
            //   child: Container(
            //     child: TextField(
            //       decoration: InputDecoration(
            //         fillColor: Colors.white,
            //         filled: true,
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(20)),
            //         hintText: 'Your title',
            //         hintStyle: TextStyle(
            //           fontSize: 16,
            //           color: const Color.fromARGB(255, 101, 101, 101),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
              child: Container(
                child: TextField(
                  controller: cont,
                  maxLines: 9,
                  minLines: 8,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Your Note',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () async {
                // del
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => (NoteApp())));

                // store data
                final SharedPreferences pref =
                    await SharedPreferences.getInstance();
                List<String> myData = pref.getStringList("note") ?? [];
                myData.add(cont.text);
                await pref.setStringList("note", myData);

                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => (NoteApp())));
              },
              child: Container(
                height: 50,
                width: 200,
                child: Center(
                    child: Text(
                  'Add Note',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(
                        -2,
                        2,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

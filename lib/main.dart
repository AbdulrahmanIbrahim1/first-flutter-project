// import 'package:flutter_application_1/taskGridView.dart';
// import 'package:flutter_application_1/task.dart';
// import 'package:flutter_application_1/taskWrap.dart';
// import 'package:flutter_application_1/test.dart';
// import 'package:flutter_application_1/test2.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/logIn.dart';
import 'package:flutter_application_1/signUp.dart';
import 'package:flutter_application_1/testALEX1.dart';

// import 'package:flutter_application_1/testALEX2.dart';
// import 'package:flutter_application_1/toastPage.dart';
// import 'package:flutter_application_1/Note.dart';
//

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Note.dart';

// import 'package:firebase_core/firebase_core.dart';
//

import 'package:flutter_application_1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  // =======addfire
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: TaskGridView(),
      // home: Taskwrap(),
      //
      // home: Task(),
      // home: Test(),
      // home: Testlogin(),
      // home: TaskLog(),
      // home: Notes(),
      // home: Toastpage(),
      // home: NoteApp(),
      // home: TaskLog(),
      // home: LogInPage(),
      // home: Auth(),
      routes: {
        '/': (context) => Auth(),
        'SignUp': (context) => SignUpPage(),
        'LogIn': (context) => LogInPage(),
      },

      // home: Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.blue,
      //   ),
      //   body: Container(
      //     width: double.infinity,
      //     child: SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           Container(
      //             width: 200,
      //             height: 200,
      //             color: Colors.red,
      //           ),
      //           Container(
      //             width: 200,
      //             height: 200,
      //             color: Colors.white,
      //           ),
      //           Container(
      //             width: 200,
      //             height: 200,
      //             color: Colors.black,
      //           ),
      //           Container(
      //             width: 200,
      //             height: 200,
      //             color: Colors.red,
      //           ),
      //           Container(
      //             width: 200,
      //             height: 200,
      //             color: Colors.white,
      //           ),
      //           Container(
      //             width: 200,
      //             height: 200,
      //             color: Colors.black,
      //           ),
      //           Container(
      //             width: 200,
      //             height: 200,
      //             color: Colors.red,
      //           ),
      //           Container(
      //             width: 200,
      //             height: 200,
      //             color: Colors.white,
      //           ),
      //           Container(
      //             width: 200,
      //             height: 200,
      //             color: Colors.black,
      //           ),
      //         ],
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //       ),
      //     ),
      //   ),
      // ),

      // home: Scaffold(
      //   backgroundColor: Colors.black,
      //   appBar: AppBar(
      //     backgroundColor: Colors.red,
      //     title: const Text(
      //       'this is a text for test ',
      //       style: TextStyle(fontSize: 20, color: Colors.white),
      //     ),      //         padding: EdgeInsets.all(8.0),
      //     actions: const [
      //       Padding(
      //         child: Icon(Icons.account_circle),
      //       )
      //     ],
      //     iconTheme: const IconThemeData(color: Colors.white),
      //   ),
      //   body: Padding(
      //     padding: const EdgeInsets.all(20),
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       color: Colors.red,
      //       margin: const EdgeInsets.all(10),
      //       child: const Text(
      //         'I\'m a child ',
      //         style: TextStyle(
      //             fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
      //       ),
      //     ),
      //   ),
      // )
    );
  }
}

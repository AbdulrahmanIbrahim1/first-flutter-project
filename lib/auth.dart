import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Note.dart';
import 'package:flutter_application_1/logIn.dart';

// import 'package:test500/not_app.dart';
// import 'package:test500/logIn.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NoteApp();
        } else {
          return LogInPage();
        }
      },
    ));
  }
}

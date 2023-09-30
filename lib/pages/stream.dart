import 'package:fetchdata/pages/auth.dart';
import 'package:fetchdata/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Streamer extends StatelessWidget {
  const Streamer({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        }
        return const Authenitication();
      },
    );
  }
}

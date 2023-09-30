import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user != null) {
              // User is signed in, fetch and display user data
              return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .snapshots(),
                builder: (context, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.active) {
                    if (userSnapshot.hasData) {
                      var userData = userSnapshot.data as Map<String, dynamic>;
                      // Now, you can use userData to display user information.
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('User Profile'),
                        ),
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Name: ${userData['name']}'),
                              Text('Email: ${userData['email']}'),
                              // Add more fields as needed
                            ],
                          ),
                        ),
                      );
                    } else {
                      // Handle the case where the user document doesn't exist
                      return const Scaffold(
                        body: Center(
                          child: Text('User data not found.'),
                        ),
                      );
                    }
                  } else {
                    // Handle loading state
                    return const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              );
            } else {
              // User is not signed in, show login or registration UI
              return const Scaffold(
                body: Center(
                  child: Text('Please sign in to view user data.'),
                ),
              );
            }
          } else {
            // Handle loading state
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

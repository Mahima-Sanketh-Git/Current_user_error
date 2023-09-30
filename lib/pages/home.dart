import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fetchdata/services/authantication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String username = '';
final User? user = FirebaseAuth.instance.currentUser;
final useruid = user!.uid;
String docid = useruid.toString();
User? userget = FirebaseAuth.instance.currentUser;

class _HomeState extends State<Home> {
  List userlist = [];
  String uiddoc = userget!.uid;
  Future getuser() async {
    DocumentReference userref = FirebaseFirestore.instance
        .collection("users")
        .doc(docid);//!Not error use manual docid doc('9BBOJZd1uGe9xxxu5iRK')
    var fetch = await userref.get();
    setState(() {
      userlist.add(fetch.data());
    });

    print(userref);
    print(userlist); //! print userlist
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                logout();
              },
              child: const Text('Log out'),
            ),
            userlist.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListTile(
                    title: Text(userlist[0]["Name"]),
                  )
          ],
        ),
      ),
    );
  }
}

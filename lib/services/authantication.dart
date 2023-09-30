import 'package:fetchdata/pages/auth.dart';
import 'package:fetchdata/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future signinwithemailandpassword() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text.trim(), password: password.text.trim());
}

Future createuser() async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email1.text, password: password1.text);
}

Future getuser() async {
  await FirebaseFirestore.instance.collection('users').add({
    "Name": name1.text.trim(),
  });
}

Future logout() async {
  await FirebaseAuth.instance.signOut();
}

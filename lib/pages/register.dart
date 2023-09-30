import 'package:fetchdata/pages/auth.dart';
import 'package:fetchdata/services/authantication.dart';
import 'package:flutter/material.dart';

class Regsiter extends StatefulWidget {
  const Regsiter({super.key});

  @override
  State<Regsiter> createState() => _RegsiterState();
}

final email1 = TextEditingController();
final password1 = TextEditingController();
final name1 = TextEditingController();

class _RegsiterState extends State<Regsiter> {
  @override
  void dispose() {
    email1.dispose();
    password1.dispose();
    name1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Center(
                child: Icon(
                  Icons.lock,
                  color: Colors.black87,
                  size: 130,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: name1,
                decoration: const InputDecoration(
                  hintText: "User Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email1,
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password1,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  createuser();
                  getuser();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Authenitication())));
                },
                child: const Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

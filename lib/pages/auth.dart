import 'package:fetchdata/pages/register.dart';
import 'package:fetchdata/services/authantication.dart';
import 'package:flutter/material.dart';

class Authenitication extends StatefulWidget {
  const Authenitication({super.key});

  @override
  State<Authenitication> createState() => _AutheniticationState();
}

final email = TextEditingController();
final password = TextEditingController();

class _AutheniticationState extends State<Authenitication> {
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
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password,
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
                  signinwithemailandpassword();
                },
                child: const Text("Log In"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Regsiter())));
                },
                child: const Text("Don't have an account"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

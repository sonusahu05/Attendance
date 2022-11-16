import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;


class Registerview extends StatefulWidget {
  const Registerview({super.key});

  @override
  State<Registerview> createState() => _RegisterviewState();
}

class _RegisterviewState extends State<Registerview> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register View"),
      ),
      body: Column(
        children: [
          TextField(
            enableSuggestions: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            controller: _email,
            decoration: const InputDecoration(
                hintText: "Enter your email here"),
          ),
          TextField(
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            controller: _password,
            decoration: const InputDecoration(
                hintText: "Enter your password here"),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                final userCredientials = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                devtools.log(userCredientials.toString());
              } on FirebaseAuthException catch (e) {
                if (e.code == "weak-password") {
                  devtools.log("Weak Password");
                } else if (e.code == "email-already-in-use") {
                  devtools.log("Email already in use");
                } else if (e.code == "invalid-email") {
                  devtools.log("Invalid Email");
                }
              }
            },
            child: const Text("Register"),
          ),
          TextButton(onPressed: () =>{
            Navigator.of(context).pushNamedAndRemoveUntil(
              "/login/",
             (route) => false
             )
          } , child: const Text("Go back to Login page"))
        ],
      ),
    );
  }
}

import 'package:attendance/constants/routes.dart';
import 'package:attendance/services/auth/auth_exceptions.dart';
import 'package:attendance/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import '../utilities/show_error.dart';

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
            decoration:
                const InputDecoration(hintText: "Enter your email here"),
          ),
          TextField(
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            controller: _password,
            decoration:
                const InputDecoration(hintText: "Enter your password here"),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await AuthService.firebase().createUser(
                  email: email,
                  password: password,
                );
                AuthService.firebase().sendEmailVerification();
                Navigator.of(context).pushNamed(verifyRoute);
              } on WeakPasswordAuthException{
                await showErrorDialog(
                    context,
                    "Weak Password",
                  );
              }  on EmailAlreadyInUseAuthException{
                  await showErrorDialog(
                    context,
                    "Email already in use",
                  );
              } on InvalidEmailAuthException{
                await showErrorDialog(
                    context,
                    "Invalid Email",
                  );
              } on GenericInAuthException{
                await showErrorDialog(
                  context,
                  "Failed to Register",
                );
              } 
            },
            child: const Text("Register"),
          ),
          TextButton(
              onPressed: () => {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/login/", (route) => false)
                  },
              child: const Text("Go back to Login page"))
        ],
      ),
    );
  }
}

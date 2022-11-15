import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          TextField(
            enableSuggestions: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            controller: _email,
            decoration: const InputDecoration(hintText: "Enter your email here"),
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
                final userCredientials =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                print(userCredientials);
              } on FirebaseAuthException catch (e) {
                if (e.code == "user-not-found") {
                  print("User Not Found");
    
                  // const AlertDialog(title: Text("Error"),content: Text("User Not Found"),);
                } else if (e.code == "wrong-password") {
                  print('Incorrect password');
                }
                // return const Text(e.code);
    
              }
              // catch (e) {
              //   print(e);
              //   // print(e.code);
              //   print(e.runtimeType);
              // }
            },
            child: const Text("Login"),
            
          ),
          TextButton(
            onPressed: () =>{
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/register/',
                 (route) => false
                )
            } ,
            child: const Text("Not registered yet? register now"),)
        ],
      ),
    );
  }
}

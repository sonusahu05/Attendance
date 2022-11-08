import 'package:attendance/firebase_options.dart';
import 'package:attendance/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Attendance',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              // case ConnectionState.none:
              //   // TODO: Handle this case.
              //   break;
              // case ConnectionState.waiting:
              //   // TODO: Handle this case.
              //   break;
              // case ConnectionState.active:
              //   // TODO: Handle this case.
              //   break;
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;

                if (user?.emailVerified ?? false) {
                  print("Email Varified");
                } else {
                  print("email not varified");
                }
                return const Text("Done");
              default:
                return const Text("Loading...");
            }
          },
        ));
  }
}

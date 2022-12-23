import 'package:attendance/constants/routes.dart';
import 'package:attendance/enums/menu_action.dart';
import 'package:attendance/services/auth/auth_provider.dart';
import 'package:attendance/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'dart:developer' as devtools show log;

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Main UI"),
          actions: [
            PopupMenuButton<MenuAction>(
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogOut = await showLogOutDialog(context);
                    devtools.log(shouldLogOut.toString());
                    if (shouldLogOut) {
                      AuthService.firebase().logOut();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(loginRoute, (_) => false);
                    }
                    break;
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem<MenuAction>(
                      value: MenuAction.logout, child: Text("logout"))
                ];
              },
            )
          ],
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            const Text('Hey Mansi Good Luck For your exams 😊😊😊'),
            Image.asset(
              'assets/images/moon.png',
              height: 500,
              width: 600,
            ),
          ],
        )));
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Sign Out"),
        content: const Text("Are you Sure You Want to Sign Out?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Logout")),
        ],
      );
    },
  ).then((value) => value ?? false);
}

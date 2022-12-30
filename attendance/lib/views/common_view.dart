import 'package:attendance/constants/routes.dart';
import 'package:attendance/enums/menu_action.dart';
import 'package:attendance/extensions/buildcontext/loc.dart';
import 'package:attendance/services/auth/bloc/auth_bloc.dart';
import 'package:attendance/services/auth/bloc/auth_event.dart';
import 'package:attendance/utilities/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as devtools show log;

class CommonView extends StatefulWidget {
  const CommonView({super.key});

  @override
  State<CommonView> createState() => _CommonViewState();
}

class _CommonViewState extends State<CommonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("common view"),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  devtools.log("test");
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    context.read<AuthBloc>().add(
                          const AuthEventLogOut(),
                        );
                  }
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text(context.loc.logout_button),
                ),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          const Text("Notes"),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                note,
                (route) => true,
              );
            },
            child: const Text(
              "notes view",
            ),
          ),
          const Text("Concession"),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                concession,
                (route) => true,
              );
            },
            child: const Text(
              "concession view",
            ),
          ),
        ],
      ),
    );
  }
}

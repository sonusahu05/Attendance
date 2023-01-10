import 'package:attendance/constants/routes.dart';
import 'package:attendance/enums/menu_action.dart';
import 'package:attendance/extensions/buildcontext/loc.dart';
import 'package:attendance/services/auth/auth_service.dart';
import 'package:attendance/services/auth/bloc/auth_bloc.dart';
import 'package:attendance/services/auth/bloc/auth_event.dart';
import 'package:attendance/services/crud/concession_service.dart';
import 'package:attendance/utilities/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConcessionRegister extends StatefulWidget {
  const ConcessionRegister({super.key});

  @override
  State<ConcessionRegister> createState() => _ConcessionRegisterState();
}

class _ConcessionRegisterState extends State<ConcessionRegister> {
  late final ConcessionService _concessionsService;
  // String get userId => AuthService.firebase().currentUser!.id;
  String get userEmail => AuthService.firebase().currentUser!.email;

  @override
  void initState() {
    _concessionsService = ConcessionService();
    super.initState();
  }

  @override
  void dispose() {
    _concessionsService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("concession register view"),
        ),
        body: FutureBuilder(
          future: _concessionsService.getOrCreateUser(email: userEmail),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return StreamBuilder(
                  stream: _concessionsService.allConcessions,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Text("Waiting for concession f");
                      default:
                        return const CircularProgressIndicator();
                    }
                  },
                );
              default:
                return const CircularProgressIndicator();
            }
          },
        ));
  }
}

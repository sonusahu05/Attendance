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

class ConcessionView extends StatefulWidget {
  const ConcessionView({super.key});

  @override
  State<ConcessionView> createState() => _ConcessionViewState();
}

class _ConcessionViewState extends State<ConcessionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("concession view"),


        ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        concessionStatus,
                        (route) => true,
                      )
                    ;
                  },
                  child: const Text(
                    'Application status',
                  ),
                ),
                  TextButton(
                  onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        concessionRequest,
                        (route) => true,
                      )
                    ;
                  },
                  child: const Text(
                    'Application request',
                  ),
                ),

                const Text("Register if applying for the first time or if you want to edit"),
                TextButton(
                  onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        concessionRegister,
                        (route) => true,
                      )
                    ;
                  },
                  child: const Text(
                    'Application register',
                  ),
                ),
              ],
              ),
          ),
      ),
    );
  }
}

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

class ConcessionRequest extends StatefulWidget {
  const ConcessionRequest({super.key});

  @override
  State<ConcessionRequest> createState() => _ConcessionRequestState();
}

class _ConcessionRequestState extends State<ConcessionRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("concession request view"),


        ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
              ],
              ),
          ),
      ),
    );
  }
}

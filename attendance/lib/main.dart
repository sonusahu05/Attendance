import 'package:attendance/views/common_view.dart';
import 'package:attendance/views/concession/concession_register.dart';
import 'package:attendance/views/concession/concession_request.dart';
import 'package:attendance/views/concession/concession_status.dart';
import 'package:attendance/views/concession/concession_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:attendance/constants/routes.dart';
import 'package:attendance/helpers/loading/loading_screen.dart';
import 'package:attendance/services/auth/bloc/auth_bloc.dart';
import 'package:attendance/services/auth/bloc/auth_event.dart';
import 'package:attendance/services/auth/bloc/auth_state.dart';
import 'package:attendance/services/auth/firebase_auth_provider.dart';
import 'package:attendance/views/forgot_password_view.dart';
import 'package:attendance/views/login_view.dart';
import 'package:attendance/views/notes/create_update_note_view.dart';
import 'package:attendance/views/notes/notes_view.dart';
import 'package:attendance/views/register_view.dart';
import 'package:attendance/views/verify_email_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      routes: {
        note: (context) => const NotesView(),
        concessionRegister: (context) => const ConcessionRegister(),
        concessionStatus: (context) => const ConcessionStatus(),
        concessionRequest: (context) => const ConcessionRequest(),
        common: (context) => const CommonView(),
        concession: (context) => const ConcessionView(),
        createOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? 'Please wait a moment',
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const CommonView();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmailView();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPasswordView();
        } else if (state is AuthStateRegistering) {
          return const RegisterView();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

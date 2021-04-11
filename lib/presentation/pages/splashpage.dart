import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/application/auth/auth_bloc/auth_bloc.dart';
import 'package:noteapp2/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            AutoRouter.of(context).pushAndRemoveUntil(const NotePageRoute(),
                predicate: (Route<dynamic> route) => false);
          },
          unAuthenticated: (_) {
            AutoRouter.of(context).pushAndRemoveUntil(const SignInPageRoute(),
                predicate: (Route<dynamic> route) => false);
          },
        );
      },
      child: Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

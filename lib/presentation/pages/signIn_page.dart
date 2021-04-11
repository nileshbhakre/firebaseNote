import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/application/auth/SignIn_bloc/signin_bloc.dart';
import 'package:noteapp2/injection.dart';
import 'package:noteapp2/widget/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: BlocProvider(
        create: (context) => getIt<SigninBloc>(),
        child: const SignInForm(),
      ),
    );
  }
}

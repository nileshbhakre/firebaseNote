import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/application/auth/SignIn_bloc/signin_bloc.dart';
import 'package:noteapp2/application/auth/auth_bloc/auth_bloc.dart';
import 'package:noteapp2/presentation/routes/router.gr.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninBloc, SignInState>(listener: (context, state) {
      state.authFailureOrSuccessOption!.fold(
          () => {},
          (some) => {
                some.fold(
                  (failure) {
                    FlushbarHelper.createError(
                        message: failure.map(
                      cancelledByUser: (_) => 'Discarded By User.',
                      serverError: (_) => 'Network Disconnected.',
                    )).show(context);
                  },
                  (unit) {
                    AutoRouter.of(context).pushAndRemoveUntil(
                      const NotePageRoute(),
                      predicate: (Route<dynamic> route) => false,
                    );
                    BlocProvider.of<AuthBloc>(context)
                        .add(const AuthEvent.authCheckRequested());
                  },
                )
              });
    }, builder: (context, state) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              '📝',
              style: TextStyle(fontSize: 60),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: state.isSubmitting == true
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SigninBloc>(context)
                            .add(const SignInEvent.signInWithGoogle());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/google1.png', scale: 1.5),
                          const SizedBox(width: 20),
                          const Text('SIGN IN WITH GOOGLE')
                        ],
                      ),
                    ),
            ),
          ],
        ),
      );
    });
  }
}

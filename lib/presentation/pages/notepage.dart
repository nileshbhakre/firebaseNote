import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/application/auth/auth_bloc/auth_bloc.dart';
import 'package:noteapp2/application/notes/note_watcher_bloc/notewatcher_bloc.dart';
import 'package:noteapp2/injection.dart';
import 'package:noteapp2/presentation/routes/router.gr.dart';
import 'package:noteapp2/widget/notes_overview_body.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            unAuthenticated: (_) {
              AutoRouter.of(context).pushAndRemoveUntil(
                const SignInPageRoute(),
                predicate: (route) => true,
              );
            },
          );
        })
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(const AuthEvent.signOut());
            },
          ),
          title: const Text('Note'),
          actions: [
            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              final user = state.maybeMap(
                orElse: () {},
                authenticated: (user) => user.user,
              );
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: user == null
                      ? Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW7imxopHcb0wMBPJiRWWufK8BqHIa8Tu4gA&usqp=CAU')
                      : Image.network(user.photoURL!),
                ),
              );
            })
          ],
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<NotewatcherBloc>()
                ..add(const NotewatcherEvent.watchAllStarted()),
            ),
          ],
          child: NotesOverviewBody(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).push(
              NoteFormPageRoute(editednote: null),
            );
          },
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/application/notes/note_watcher_bloc/notewatcher_bloc.dart';
import 'package:noteapp2/presentation/routes/router.gr.dart';

class NotesOverviewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotewatcherBloc, NotewatcherState>(
        builder: (context, state) {
      return state.map(
        initial: (_) {
          return Container();
        },
        loadInProgress: (_) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        loadSuccess: (state) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            child: ListView.builder(
                itemCount: state.notes.size,
                itemBuilder: (context, index) {
                  final note = state.notes[index];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      onTap: () {
                        AutoRouter.of(context)
                            .push(NoteFormPageRoute(editednote: note)
                                //predicate: (Route<dynamic> route) => false,
                                );
                      },
                      title: Text(note!.title!.value),
                      subtitle: Text(note.body!.value),
                    ),
                  );
                }),
          );
        },
        loadFailure: (state) {
          return Text(
            state.noteFailure.maybeMap(
                orElse: () => 'Unexpected Error.',
                insufficientPermission: (_) => 'Permission Denied'),
          );
        },
      );
    });
  }
}

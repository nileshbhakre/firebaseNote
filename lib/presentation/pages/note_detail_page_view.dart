import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/application/notes/note_action/noteaction_bloc.dart';
import 'package:noteapp2/domain/notes/note.dart';

class NoteDetailPageView extends StatelessWidget {
  final Note? note;
  const NoteDetailPageView({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note!.title!.value),
        actions: [
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<NoteactionBloc>(context)
                  .add(NoteactionEvent.deleteNote(note!));
              AutoRouter.of(context).pop();
            },
            child: const Text('Delete'),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note!.body!.value),
            ],
          ),
          BlocBuilder<NoteactionBloc, NoteactionState>(
            builder: (context, state) {
              return state.maybeMap(
                  initial: (_) => Container(
                        color: Colors.transparent,
                      ),
                  loadingAction: (_) => Container(
                        color: Colors.black.withOpacity(0.3),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  orElse: () => const Text('Network Error'));
            },
          )
        ],
      ),
    );
  }
}

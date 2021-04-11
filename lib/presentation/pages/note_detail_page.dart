import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/application/notes/note_action/noteaction_bloc.dart';
import 'package:noteapp2/domain/notes/note.dart';
import 'package:noteapp2/injection.dart';
import 'package:noteapp2/presentation/pages/note_detail_page_view.dart';

class NoteDetailPage extends StatelessWidget {
  final Note? note;
  const NoteDetailPage({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<NoteactionBloc>()),
      ],
      child: NoteDetailPageView(note: note),
    );
  }
}

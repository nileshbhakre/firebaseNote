//import 'package:auto_route/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/application/notes/bloc/my_form_bloc.dart';
import 'package:noteapp2/domain/notes/note.dart';
import 'package:noteapp2/injection.dart';
import 'package:noteapp2/presentation/pages/note_form/my_form.dart';

class NoteFormPage extends StatelessWidget {
  final Note? editednote;

  const NoteFormPage({
    Key? key,
    required this.editednote,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MyFormBloc>()
        ..add(
          InitialNote(note: optionOf(editednote)),
        ),
      child: MyForm(),
    );
  }
}

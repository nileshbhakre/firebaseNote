import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:noteapp2/domain/notes/I_note_respository.dart';
import 'package:noteapp2/domain/notes/note.dart';
import 'package:noteapp2/domain/notes/note_failure.dart';

part 'noteaction_event.dart';
part 'noteaction_state.dart';
part 'noteaction_bloc.freezed.dart';

@injectable
class NoteactionBloc extends Bloc<NoteactionEvent, NoteactionState> {
  final INoteRepository iNoteRepository;
  NoteactionBloc(this.iNoteRepository) : super(const NoteactionState.initial());

  @override
  Stream<NoteactionState> mapEventToState(
    NoteactionEvent event,
  ) async* {
    yield* event.map(deleteNote: (e) async* {
      yield const NoteactionState.loadingAction();
      final options = await iNoteRepository.delete(e.note);
      yield options.fold(
        (f) => NoteactionState.deleteFailure(f),
        (_) => const NoteactionState.deleteSuccess(),
      );
    });
  }
}

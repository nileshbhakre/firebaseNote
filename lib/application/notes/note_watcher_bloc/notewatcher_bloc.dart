import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:noteapp2/domain/notes/I_note_respository.dart';
import 'package:noteapp2/domain/notes/note.dart';
import 'package:noteapp2/domain/notes/note_failure.dart';

part 'notewatcher_event.dart';
part 'notewatcher_state.dart';
part 'notewatcher_bloc.freezed.dart';

@injectable
class NotewatcherBloc extends Bloc<NotewatcherEvent, NotewatcherState> {
  final INoteRepository _iNoteRepository;

  NotewatcherBloc(this._iNoteRepository)
      : super(const NotewatcherState.initial());

  StreamSubscription<Either<NoteFailure, KtList<Note?>>>?
      _notesstreamsubscription;

  @override
  Stream<NotewatcherState> mapEventToState(
    NotewatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const NotewatcherState.loadInProgress();
        await _notesstreamsubscription?.cancel();

        _notesstreamsubscription =
            _iNoteRepository.watchNotes().listen((failureOrNotes) {
          add(NotewatcherEvent.notesRecieved(failureOrNotes));
        });
      },
      notesRecieved: (e) async* {
        yield e.failuteorNote.fold(
          (f) => NotewatcherState.loadFailure(f),
          (notes) => NotewatcherState.loadSuccess(notes),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _notesstreamsubscription?.cancel();
    return super.close();
  }
}

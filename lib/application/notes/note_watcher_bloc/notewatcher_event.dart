part of 'notewatcher_bloc.dart';

@freezed
class NotewatcherEvent with _$NotewatcherEvent {
  const factory NotewatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory NotewatcherEvent.notesRecieved(
      Either<NoteFailure, KtList<Note?>> failuteorNote) = _NotesRecieved;
}

part of 'noteaction_bloc.dart';

@freezed
class NoteactionEvent with _$NoteactionEvent {
  const factory NoteactionEvent.deleteNote(Note note) = _DeleteNote;
}

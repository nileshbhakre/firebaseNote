import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:noteapp2/domain/core/value_object.dart';
import 'package:noteapp2/domain/notes/value_object.dart';

part 'note.freezed.dart';

@freezed
abstract class Note with _$Note {
  const factory Note({
    UniqueId? id,
    NoteTitle? title,
    NoteBody? body,
  }) = _Note;

  factory Note.initial() => Note(
        id: UniqueId(),
        title: const NoteTitle.pure(),
        body: const NoteBody.pure(),
      );
}

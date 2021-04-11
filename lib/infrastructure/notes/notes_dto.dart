import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noteapp2/domain/core/value_object.dart';
import 'package:noteapp2/domain/notes/note.dart';
import 'package:flutter/foundation.dart';
import 'package:noteapp2/domain/notes/value_object.dart';

part 'notes_dto.freezed.dart';
part 'notes_dto.g.dart';

@freezed
abstract class NoteDto with _$NoteDto {
  factory NoteDto(
      {@JsonKey(ignore: true) String? id,
      @required String? title,
      @required String? body}) = _NoteDto;

  factory NoteDto.fromDomain(Note note) {
    return NoteDto(
      id: note.id!.getorCrash(),
      title: note.title!.value,
      body: note.body!.value,
    );
  }
  factory NoteDto.fromJson(Map<String, dynamic>? json) =>
      _$NoteDtoFromJson(json!);

  factory NoteDto.fromFirestore(DocumentSnapshot doc) {
    return NoteDto.fromJson(doc.data()).copyWith(id: doc.id);
  }
}

extension NoteDtox on NoteDto {
  Note toDomain() {
    return Note(
      id: UniqueId.frouniqueString(id),
      title: NoteTitle.pure(title!),
      body: NoteBody.pure(body!),
    );
  }
}

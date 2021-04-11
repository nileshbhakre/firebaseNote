import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:noteapp2/domain/notes/note.dart';
import 'package:noteapp2/domain/notes/note_failure.dart';

abstract class INoteRepository {
  Stream<Either<NoteFailure, KtList<Note?>>> watchNotes();
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> delete(Note note);
}

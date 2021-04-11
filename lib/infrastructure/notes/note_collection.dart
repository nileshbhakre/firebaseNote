import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:noteapp2/domain/notes/I_note_respository.dart';
import 'package:noteapp2/domain/notes/note.dart';
import 'package:noteapp2/domain/notes/note_failure.dart';
import 'package:noteapp2/infrastructure/core/firestore_helpers.dart';
import 'package:noteapp2/infrastructure/notes/notes_dto.dart';
import 'package:rxdart/rxdart.dart';

//import 'package:rxdart/rxdart.dart';
@prod
@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firebaseFirestore;

  NoteRepository(this._firebaseFirestore);

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userdoc = await _firebaseFirestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);
      await userdoc.noteCollection.doc(noteDto.id).set(noteDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await _firebaseFirestore.userDocument();
      await userDoc.noteCollection.doc(note.id!.getorCrash()).delete();
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userdoc = await _firebaseFirestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);
      await userdoc.noteCollection.doc(noteDto.id).update(noteDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchNotes() async* {
    final userDoc = await _firebaseFirestore.userDocument();
    yield* userDoc.noteCollection
        .snapshots()
        .map(
          (snapshot) => right<NoteFailure, KtList<Note>>(
            snapshot.docs
                .map(
                  (doc) => NoteDto.fromFirestore(doc).toDomain(),
                )
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    });
  }
}

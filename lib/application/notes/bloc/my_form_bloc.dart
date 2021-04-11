import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:noteapp2/domain/core/value_object.dart';
import 'package:noteapp2/domain/notes/I_note_respository.dart';
import 'package:noteapp2/domain/notes/note.dart';
import 'package:noteapp2/domain/notes/value_object.dart';

part 'my_form_event.dart';
part 'my_form_state.dart';

@injectable
class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
  final INoteRepository iNoteRepository;
  MyFormBloc(this.iNoteRepository) : super(const MyFormState());

  @override
  void onTransition(Transition<MyFormEvent, MyFormState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<MyFormState> mapEventToState(MyFormEvent event) async* {
    if (event is InitialNote) {
      yield event.note!.fold(
          () => state,
          (note) => state.copyWith(
                email: note.title,
                password: note.body,
                isEditing: true,
              ));
    }
    if (event is EmailChanged) {
      final email = NoteTitle.dirty(event.email!);
      yield state.copyWith(
        email: email.valid ? email : NoteTitle.pure(event.email!),
        status: Formz.validate([email, state.password]),
      );
    } else if (event is PasswordChanged) {
      final password = NoteBody.dirty(event.password!);
      yield state.copyWith(
        password: password.valid ? password : NoteBody.pure(event.password!),
        status: Formz.validate([state.email, password]),
      );
    } else if (event is EmailUnfocused) {
      final email = NoteTitle.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      );
    } else if (event is PasswordUnfocused) {
      final password = NoteBody.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      );
    } else if (event is FormSubmitted) {
      final email = NoteTitle.dirty(state.email.value);
      final password = NoteBody.dirty(state.password.value);
      yield state.copyWith(
        email: email,
        password: password,
        status: Formz.validate([email, password]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        final option = await iNoteRepository.create(
          Note(
            id: UniqueId(),
            title: state.email,
            body: state.password,
          ),
        );
        yield option.fold(
          (_) => state.copyWith(status: FormzStatus.submissionFailure),
          (_) => state.copyWith(status: FormzStatus.submissionSuccess),
        );
      }
    }
  }
}

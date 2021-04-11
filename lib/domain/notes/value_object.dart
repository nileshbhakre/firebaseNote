import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class NoteTitle extends FormzInput<String, EmailValidationError> {
  const NoteTitle.pure([String value = '']) : super.pure(value);
  const NoteTitle.dirty([String value = '']) : super.dirty(value);

  @override
  String get value => super.value;
  @override
  EmailValidationError? validator(String? value) {
    return value!.isNotEmpty ? null : EmailValidationError.invalid;
  }
}

class NoteBody extends FormzInput<String, EmailValidationError> {
  const NoteBody.pure([String value = '']) : super.pure(value);
  const NoteBody.dirty([String value = '']) : super.dirty(value);
  @override
  String get value => super.value;
  @override
  EmailValidationError? validator(String? value) {
    return value!.isNotEmpty ? null : EmailValidationError.invalid;
  }
}

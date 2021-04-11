part of 'my_form_bloc.dart';

abstract class MyFormEvent extends Equatable {
  const MyFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialNote extends MyFormEvent {
  const InitialNote({this.note});

  final Option<Note>? note;

  @override
  List<Object?> get props => [note];
}

class EmailChanged extends MyFormEvent {
  const EmailChanged({this.email});

  final String? email;

  @override
  List<Object?> get props => [email];
}

class EmailUnfocused extends MyFormEvent {}

class PasswordChanged extends MyFormEvent {
  const PasswordChanged({this.password});

  final String? password;

  @override
  List<Object?> get props => [password];
}

class PasswordUnfocused extends MyFormEvent {}

class FormSubmitted extends MyFormEvent {}

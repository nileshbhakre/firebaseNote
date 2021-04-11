part of 'my_form_bloc.dart';

class MyFormState extends Equatable {
  const MyFormState({
    this.email = const NoteTitle.pure(),
    this.password = const NoteBody.pure(),
    this.isEditing = false,
    this.status = FormzStatus.pure,
  });

  final NoteTitle email;
  final NoteBody password;
  final FormzStatus status;
  final bool isEditing;

  MyFormState copyWith({
    NoteTitle? email,
    NoteBody? password,
    bool? isEditing,
    FormzStatus? status,
  }) {
    return MyFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEditing: isEditing ?? this.isEditing,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}

part of 'signin_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.signInWithGoogle() = SignInWithGoogle;
}

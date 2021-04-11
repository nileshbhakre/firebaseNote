part of 'signin_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @required bool? isSubmitting,
    @required Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption,
  }) = _SignInState;

  factory SignInState.initial() => SignInState(
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}

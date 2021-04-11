import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:noteapp2/domain/auth/auth_failure.dart';
import 'package:noteapp2/domain/auth/i_auth_facade.dart';

part 'signin_event.dart';
part 'signin_state.dart';
part 'signin_bloc.freezed.dart';

@injectable
class SigninBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthFacade _iAuthFacade;
  SigninBloc(this._iAuthFacade) : super(SignInState.initial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    yield* event.map(signInWithGoogle: (e) async* {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      final failureorSuccess = await _iAuthFacade.signedInWithGoogle();
      yield state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureorSuccess),
      );
    });
  }
}

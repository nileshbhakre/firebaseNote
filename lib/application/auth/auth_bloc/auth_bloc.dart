import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:noteapp2/domain/auth/i_auth_facade.dart';
import 'package:noteapp2/domain/auth/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _iAuthFacade;

  AuthBloc(this._iAuthFacade) : super(const AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        final userOption = await _iAuthFacade.getSignedUser();
        print(userOption);
        yield userOption.fold(
          () => const AuthState.unAuthenticated(),
          (user) => AuthState.authenticated(user),
        );
      },
      signOut: (e) async* {
        await _iAuthFacade.signOut();
        yield const AuthState.unAuthenticated();
      },
    );
  }
}

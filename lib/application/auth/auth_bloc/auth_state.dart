part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated(LocalUser user) = Authenticated;
  const factory AuthState.unAuthenticated() = UnAuthenticated;
}

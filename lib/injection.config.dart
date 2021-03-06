// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc/auth_bloc.dart' as _i15;
import 'application/auth/SignIn_bloc/signin_bloc.dart' as _i14;
import 'application/notes/bloc/my_form_bloc.dart' as _i11;
import 'application/notes/note_action/noteaction_bloc.dart' as _i12;
import 'application/notes/note_watcher_bloc/notewatcher_bloc.dart' as _i13;
import 'domain/auth/i_auth_facade.dart' as _i7;
import 'domain/notes/I_note_respository.dart' as _i9;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i8;
import 'infrastructure/auth/firebase_user_mapper.dart' as _i5;
import 'infrastructure/core/firebase_injectable_module.dart' as _i16;
import 'infrastructure/notes/note_collection.dart' as _i10;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.FirebaseUserMapper>(() => _i5.FirebaseUserMapper());
  gh.lazySingleton<_i6.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i7.IAuthFacade>(
      () => _i8.FirebaseAuthFacade(get<_i3.FirebaseAuth>(),
          get<_i6.GoogleSignIn>(), get<_i5.FirebaseUserMapper>()),
      registerFor: {_prod});
  gh.lazySingleton<_i9.INoteRepository>(
      () => _i10.NoteRepository(get<_i4.FirebaseFirestore>()),
      registerFor: {_prod});
  gh.factory<_i11.MyFormBloc>(
      () => _i11.MyFormBloc(get<_i9.INoteRepository>()));
  gh.factory<_i12.NoteactionBloc>(
      () => _i12.NoteactionBloc(get<_i9.INoteRepository>()));
  gh.factory<_i13.NotewatcherBloc>(
      () => _i13.NotewatcherBloc(get<_i9.INoteRepository>()));
  gh.factory<_i14.SigninBloc>(() => _i14.SigninBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i15.AuthBloc>(() => _i15.AuthBloc(get<_i7.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i16.FirebaseInjectableModule {}

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'package:noteapp2/domain/auth/auth_failure.dart';
import 'package:noteapp2/domain/auth/i_auth_facade.dart';
import 'package:noteapp2/domain/auth/user.dart';
import 'package:noteapp2/infrastructure/auth/firebase_user_mapper.dart';

@prod
@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseUserMapper firebaseUserMapper;
  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this.firebaseUserMapper,
  );
  @override
  Future<Option<LocalUser>> getSignedUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      return optionOf(null);
    }
    return optionOf(firebaseUserMapper.toDomain(user));
  }

  @override
  Future<Either<AuthFailure, Unit>> signedInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(
          const AuthFailure.cancelledByUser(),
        );
      }
      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      return _firebaseAuth.signInWithCredential(authCredential).then(
            (user) => right(unit),
          );
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

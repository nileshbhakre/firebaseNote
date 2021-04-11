import 'package:dartz/dartz.dart';

import 'package:noteapp2/domain/auth/auth_failure.dart';
import 'package:noteapp2/domain/auth/user.dart';

abstract class IAuthFacade {
  Future<Option<LocalUser>> getSignedUser();
  Future<Either<AuthFailure, Unit>> signedInWithGoogle();
  Future<void> signOut();
}

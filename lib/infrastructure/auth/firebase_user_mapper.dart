import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:noteapp2/domain/auth/user.dart';
import 'package:noteapp2/domain/core/value_object.dart';

@lazySingleton
class FirebaseUserMapper {
  LocalUser toDomain(User? user) {
    return LocalUser(
      id: UniqueId.frouniqueString(user!.uid),
      name: user.displayName,
      emailAddress: user.email,
      photoURL: user.photoURL,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noteapp2/domain/auth/i_auth_facade.dart';
import 'package:noteapp2/domain/core/failures.dart';
import 'package:noteapp2/injection.dart';

extension FireStoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedUser();
    final user = userOption.getOrElse(() => throw NoAuthenticatedError());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id!.getorCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}

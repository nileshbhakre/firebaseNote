import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noteapp2/domain/core/entity.dart';
import 'package:noteapp2/domain/core/value_object.dart';
part 'user.freezed.dart';

@freezed
abstract class LocalUser with _$LocalUser implements IEntity {
  const factory LocalUser({
    @required UniqueId? id,
    @required String? name,
    @required String? emailAddress,
    @required String? photoURL,
  }) = _LocalUser;
}

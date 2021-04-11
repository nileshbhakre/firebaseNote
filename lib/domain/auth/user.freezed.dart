// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocalUserTearOff {
  const _$LocalUserTearOff();

  _LocalUser call(
      {UniqueId? id, String? name, String? emailAddress, String? photoURL}) {
    return _LocalUser(
      id: id,
      name: name,
      emailAddress: emailAddress,
      photoURL: photoURL,
    );
  }
}

/// @nodoc
const $LocalUser = _$LocalUserTearOff();

/// @nodoc
mixin _$LocalUser {
  UniqueId? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get emailAddress => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalUserCopyWith<LocalUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalUserCopyWith<$Res> {
  factory $LocalUserCopyWith(LocalUser value, $Res Function(LocalUser) then) =
      _$LocalUserCopyWithImpl<$Res>;
  $Res call(
      {UniqueId? id, String? name, String? emailAddress, String? photoURL});
}

/// @nodoc
class _$LocalUserCopyWithImpl<$Res> implements $LocalUserCopyWith<$Res> {
  _$LocalUserCopyWithImpl(this._value, this._then);

  final LocalUser _value;
  // ignore: unused_field
  final $Res Function(LocalUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? emailAddress = freezed,
    Object? photoURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocalUserCopyWith<$Res> implements $LocalUserCopyWith<$Res> {
  factory _$LocalUserCopyWith(
          _LocalUser value, $Res Function(_LocalUser) then) =
      __$LocalUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId? id, String? name, String? emailAddress, String? photoURL});
}

/// @nodoc
class __$LocalUserCopyWithImpl<$Res> extends _$LocalUserCopyWithImpl<$Res>
    implements _$LocalUserCopyWith<$Res> {
  __$LocalUserCopyWithImpl(_LocalUser _value, $Res Function(_LocalUser) _then)
      : super(_value, (v) => _then(v as _LocalUser));

  @override
  _LocalUser get _value => super._value as _LocalUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? emailAddress = freezed,
    Object? photoURL = freezed,
  }) {
    return _then(_LocalUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
class _$_LocalUser implements _LocalUser {
  const _$_LocalUser({this.id, this.name, this.emailAddress, this.photoURL});

  @override
  final UniqueId? id;
  @override
  final String? name;
  @override
  final String? emailAddress;
  @override
  final String? photoURL;

  @override
  String toString() {
    return 'LocalUser(id: $id, name: $name, emailAddress: $emailAddress, photoURL: $photoURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.photoURL, photoURL) ||
                const DeepCollectionEquality()
                    .equals(other.photoURL, photoURL)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(photoURL);

  @JsonKey(ignore: true)
  @override
  _$LocalUserCopyWith<_LocalUser> get copyWith =>
      __$LocalUserCopyWithImpl<_LocalUser>(this, _$identity);
}

abstract class _LocalUser implements LocalUser {
  const factory _LocalUser(
      {UniqueId? id,
      String? name,
      String? emailAddress,
      String? photoURL}) = _$_LocalUser;

  @override
  UniqueId? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get emailAddress => throw _privateConstructorUsedError;
  @override
  String? get photoURL => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocalUserCopyWith<_LocalUser> get copyWith =>
      throw _privateConstructorUsedError;
}

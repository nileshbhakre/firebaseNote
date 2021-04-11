import 'package:dartz/dartz.dart';
import 'package:noteapp2/domain/core/common_interface.dart';
import 'package:noteapp2/domain/core/failures.dart';
import 'package:noteapp2/domain/core/value_failure.dart';
import 'package:noteapp2/domain/core/value_validators.dart';
import 'package:uuid/uuid.dart';

abstract class ValueObejct<T> implements IValidatable {
  const ValueObejct();
  Either<ValueFailure<T>, T> get value;

  T getorCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  bool isValid() {
    return value.isRight();
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObejct<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObejct<String?> {
  @override
  final Either<ValueFailure<String>, String?> value;

  factory UniqueId() {
    return UniqueId._(right(
      const Uuid().v1(),
    ));
  }

  factory UniqueId.frouniqueString(String? uniqueIdstr) {
    return UniqueId._(right(uniqueIdstr));
  }

  const UniqueId._(this.value);
}

class StringSingleLine extends ValueObejct<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StringSingleLine(String input) {
    return StringSingleLine._(
      validateSingleLine(input),
    );
  }

  const StringSingleLine._(this.value);
}

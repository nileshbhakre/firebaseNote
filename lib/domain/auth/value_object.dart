import 'package:dartz/dartz.dart';
import 'package:noteapp2/domain/core/value_failure.dart';
import 'package:noteapp2/domain/core/value_object.dart';
import 'package:noteapp2/domain/core/value_validators.dart';

class EmailAddress extends ValueObejct<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

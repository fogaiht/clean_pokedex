import 'package:meta/meta.dart';

import 'errors.dart';

class DomainError extends IError {
  final String message;

  const DomainError({@required this.message}) : super(message: message);

  @override
  String toString() => 'DomainError(message: $message)';
}

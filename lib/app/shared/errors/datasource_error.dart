import 'package:meta/meta.dart';

import 'errors.dart';

class DatasourceError extends IError {
  final String message;

  const DatasourceError({@required this.message}) : super(message: message);

  @override
  String toString() => 'DatasourceError(message: $message)';
}

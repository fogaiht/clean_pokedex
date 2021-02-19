import 'package:meta/meta.dart';

abstract class IError implements Exception {
  final String message;

  const IError({@required this.message});
}

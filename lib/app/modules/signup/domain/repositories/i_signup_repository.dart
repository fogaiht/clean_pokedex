
import 'package:dartz/dartz.dart';

import '../../../../shared/errors/errors.dart';
import '../entities/create_user_response.dart';
import '../params/create_user_params.dart';

abstract class ISignupRepository {
  Future<Either<IError, CreateUserResponse>> call(CreateUserParams params);
}
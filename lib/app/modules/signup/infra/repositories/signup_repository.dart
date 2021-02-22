import 'package:clean_pokedex/app/shared/errors/errors.dart';

import '../../domain/params/create_user_params.dart';
import '../../domain/entities/create_user_response.dart';
import '../../domain/repositories/i_signup_repository.dart';
import '../datasources/i_create_user_datasource.dart';
import 'package:dartz/dartz.dart';

class SignupRepository implements ISignupRepository {
  final ICreateUserDatasource datasource;

  SignupRepository(this.datasource);

  @override
  Future<Either<IError, CreateUserResponse>> call(CreateUserParams params) async {
    try {
      var result = await datasource(params);
      return Right(result);
    } on DomainError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError(message: e.toString()));
    }
  }
}

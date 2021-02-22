import 'package:clean_pokedex/app/modules/signup/domain/entities/create_user_response.dart';
import 'package:clean_pokedex/app/modules/signup/domain/params/create_user_params.dart';
import 'package:clean_pokedex/app/modules/signup/domain/repositories/i_signup_repository.dart';
import 'package:clean_pokedex/app/shared/errors/errors.dart';
import 'package:clean_pokedex/app/shared/storage/secure_app_storage.dart';
import 'package:dartz/dartz.dart';

abstract class ISignupUseCase {
  Future<Either<IError, CreateUserResponse>> call(CreateUserParams params);
}

class SignupUsecase extends ISignupUseCase {
  final ISignupRepository repository;
  final SecureAppStorage prefs;

  SignupUsecase(this.repository, this.prefs);

  @override
  Future<Either<IError, CreateUserResponse>> call(CreateUserParams params) async {
    // if (params.email.isEmpty) {
    //   return Left(DomainError(message: "Email vazio"));
    // }
    // if (params.password.isEmpty) {
    //   return Left(DomainError(message: "Senha vazia"));
    // }

    if(params.hasError){
      return Left(DomainError(message:"Há parâmetros vazios"));
    }

    final result = await repository.call(params);

    return result;
  }
}

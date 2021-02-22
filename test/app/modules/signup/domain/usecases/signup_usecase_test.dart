import 'package:clean_pokedex/app/modules/signup/domain/entities/create_user_response.dart';
import 'package:clean_pokedex/app/modules/signup/domain/params/create_user_params.dart';
import 'package:clean_pokedex/app/modules/signup/domain/repositories/i_signup_repository.dart';
import 'package:clean_pokedex/app/modules/signup/domain/usecases/signup_usecase.dart';
import 'package:clean_pokedex/app/shared/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ISignupRepositoryMock extends Mock implements ISignupRepository {}

main() {
  SignupUsecase usecase;
  ISignupRepository repository;

  setUp(() {
    repository = ISignupRepositoryMock();
    usecase = SignupUsecase(repository);
  });
  test("Deve retornar um CreateUserResponse", () async {
    final params = CreateUserParams(email: "a", password: "a", name: "a");
    when(repository(any)).thenAnswer((_) async => Right(CreateUserResponse()));

    final result = await usecase(params);

    expect(result, isA<Right>());
    expect(result.fold(id, id), isA<CreateUserResponse>());
  });
  test("Deve retornar um DomainError", () async {
    final params = CreateUserParams(email: "", password: "a", name: "a");
    // when(repository(any)).thenAnswer((_) async => Left(DomainError(message: "asdf")));

    final result = await usecase(params);

    expect(result, isA<Left>());
    expect(result.fold(id, id), isA<DomainError>());
  });
}

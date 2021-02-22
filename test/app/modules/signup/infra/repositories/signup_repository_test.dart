import 'package:clean_pokedex/app/modules/signup/domain/entities/create_user_response.dart';
import 'package:clean_pokedex/app/modules/signup/domain/params/create_user_params.dart';
import 'package:clean_pokedex/app/modules/signup/domain/repositories/i_signup_repository.dart';
import 'package:clean_pokedex/app/modules/signup/infra/datasources/i_create_user_datasource.dart';
import 'package:clean_pokedex/app/modules/signup/infra/repositories/signup_repository.dart';
import 'package:clean_pokedex/app/shared/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ICreateUserDatasourceMock extends Mock implements ICreateUserDatasource {}

main() {
  ICreateUserDatasource datasource;
  ISignupRepository repository;
  CreateUserParams params;

  setUp(() {
    datasource = ICreateUserDatasourceMock();
    repository = SignupRepository(datasource);
    params = CreateUserParams(name: "opa", email: "null", password: "null");
  });
  test("Deve retornar um CreateUserResponse", () async {
    when(datasource(any)).thenAnswer((_) async => CreateUserResponse(name: "aoba"));

    final result = await repository(params);

    expect(result, isA<Right>());
    expect(result.fold(id, id), isA<CreateUserResponse>());
    verify(datasource(any)).called(1);
  });
  test("Deve retornar um DomainError", () async {
    when(datasource(any)).thenThrow(DomainError(message: "null"));

    final result = await repository(params);

    expect(result, isA<Left>());
    expect(result.fold(id, id), isA<DomainError>());
    verify(datasource(any)).called(1);
  });
  test("Deve retornar um DatasourceError", () async {
    when(datasource(any)).thenThrow(DatasourceError(message: "null"));

    final result = await repository(params);

    expect(result, isA<Left>());
    expect(result.fold(id, id), isA<DatasourceError>());
    verify(datasource(any)).called(1);
  });
}

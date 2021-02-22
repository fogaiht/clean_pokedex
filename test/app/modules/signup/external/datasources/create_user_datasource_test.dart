import 'dart:io';

import 'package:clean_pokedex/app/modules/signup/domain/entities/create_user_response.dart';
import 'package:clean_pokedex/app/modules/signup/domain/params/create_user_params.dart';
import 'package:clean_pokedex/app/modules/signup/external/datasources/create_user_datasource.dart';
import 'package:clean_pokedex/app/shared/errors/errors.dart';
import 'package:clean_pokedex/app/shared/services/http_service/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../payloads/payloads.dart';

class IHttpServiceMock extends Mock implements IHttpService {}

main() {
  CreateUserDatasource datasource;
  IHttpService httpServiceMock;
  CreateUserParams params;

  setUp(() {
    httpServiceMock = IHttpServiceMock();
    datasource = CreateUserDatasource(httpServiceMock);
    params = CreateUserParams(name: "opa", email: "", password: "null");
  });
  group("CreateUserDatasource ->", () {
    test("Deve retornar CreateUserResponse", () async {
      when(httpServiceMock.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response(statusCode: HttpStatus.ok, data: createUserPayload),
      );

      final response = await datasource(params);
      expect(response, isA<CreateUserResponse>());
      verify(httpServiceMock.post(any, data: anyNamed('data'))).called(1);
    });
    test("Deve retornar DatasourceError", () async {
      when(httpServiceMock.post(any, data: anyNamed('data'))).thenThrow(
        DioError(response: Response(statusCode: HttpStatus.internalServerError, data: createUserPayload)),
      );

      final response = datasource(params);
      expect(response, throwsA(isA<DatasourceError>()));
      verify(httpServiceMock.post(any, data: anyNamed('data'))).called(1);
    });
    test("Deve retornar DomainError", () async {
      when(httpServiceMock.post(any, data: anyNamed('data'))).thenThrow(
        Exception("DomainErrorTest"),
      );

      final response = datasource(params);
      expect(response, throwsA(isA<DomainError>()));
      verify(httpServiceMock.post(any, data: anyNamed('data'))).called(1);
    });
  });
}

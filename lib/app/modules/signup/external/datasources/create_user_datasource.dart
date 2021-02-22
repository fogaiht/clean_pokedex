import 'package:clean_pokedex/app/modules/signup/domain/params/create_user_params.dart';
import 'package:clean_pokedex/app/modules/signup/domain/entities/create_user_response.dart';
import 'package:clean_pokedex/app/modules/signup/external/mapper/create_user_response_mapper.dart';
import 'package:clean_pokedex/app/modules/signup/infra/datasources/i_create_user_datasource.dart';
import 'package:clean_pokedex/app/shared/errors/errors.dart';
import 'package:clean_pokedex/app/shared/services/http_service/http_service.dart';
import 'package:dio/dio.dart';

class CreateUserDatasource extends ICreateUserDatasource {
  final IHttpService httpService;

  CreateUserDatasource(this.httpService);

  @override
  Future<CreateUserResponse> call(CreateUserParams params) async {
    try {
      var response = await httpService.post(
        "/create",
        data: params.toJsonParams(),
      );

      final _finalResponse = CreateUserResponseMapper.fromJson(response.data);
      print(_finalResponse);
      return _finalResponse;
    } on DioError catch (e) {
      throw DatasourceError(message: e.response.data.toString());
    } catch (e) {
      throw DomainError(message: e.toString());
    }
  }
}

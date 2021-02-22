import '../../domain/entities/create_user_response.dart';
import '../../domain/params/create_user_params.dart';

abstract class ICreateUserDatasource {
  Future<CreateUserResponse> call(CreateUserParams params);
}

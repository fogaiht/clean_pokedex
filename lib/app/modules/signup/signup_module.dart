import 'package:clean_pokedex/app/modules/signup/presenter/signup_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/services/http_service/http_service.dart';
import 'domain/usecases/signup_usecase.dart';
import 'external/datasources/create_user_datasource.dart';
import 'infra/repositories/signup_repository.dart';
import 'presenter/signup_controller.dart';
import 'presenter/signup_page.dart';
import 'presenter/signup_store.dart';

class SignupModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CreateUserDatasource(Modular.get<HttpService>())),
        Bind((i) => SignupRepository(i())),
        Bind((i) => SignupUsecase(i(), i())),

        //Presenter
        Bind((i) => SignupStore()),
        Bind((i) => SignupValidator(i())),
        Bind((i) => SignupController(i(), i(), i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SignupPage()),
      ];

  static Inject get to => Inject<SignupModule>.of();
}

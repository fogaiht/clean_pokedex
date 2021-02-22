import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/signup/signup_module.dart';
import 'shared/services/http_service/http_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => HttpService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SignupModule()),
        // ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

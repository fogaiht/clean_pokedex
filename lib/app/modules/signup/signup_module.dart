import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/signup_page.dart';

class SignupModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SignupPage()),
      ];

  static Inject get to => Inject<SignupModule>.of();
}

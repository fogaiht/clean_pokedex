import 'package:clean_pokedex/app/shared/utils/sub_states.dart';

import '../domain/params/create_user_params.dart';
import '../domain/usecases/signup_usecase.dart';
import 'signup_store.dart';
import 'signup_validator.dart';

class SignupController {
  final SignupUsecase signupUsecase;
  final SignupStore store;
  final SignupValidator validators;

  SignupController(this.signupUsecase, this.store, this.validators);

  createAccount() async {
    store.setSubState(SubState.loading);
    var _params = CreateUserParams(name: store.name, email: store.email, password: store.password);
    final response = await signupUsecase(_params);

    print(response);
    response.fold(
      (l) => store.setSubState(SubState.error),
      (r) => store.setSubState(SubState.success),
    );

    Future.delayed(Duration(milliseconds: 1500)).then((value) => store.setSubState(SubState.start));
  }
}


import '../domain/params/create_user_params.dart';
import '../domain/usecases/signup_usecase.dart';
import 'signup_store.dart';
import 'signup_validator.dart';

class SignupController {
  final SignupUsecase signupUsecase;
  final SignupStore store;
  final SignupValidator validators;

  SignupController(this.signupUsecase, this.store, this.validators);

  createAccount() {
    var _params = CreateUserParams(name: store.name, email: store.email, password: store.password);
    signupUsecase(_params);
  }
}

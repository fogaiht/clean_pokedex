import 'package:meta/meta.dart';

class CreateUserParams {
  CreateUserParams({
    @required this.name,
    @required this.email,
    @required this.password,
  });

  final String name;
  final String email;
  final String password;

  Map<String, dynamic> toJsonParams() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "pokemonList": [],
      };

  bool get hasError => name.isEmpty || email.isEmpty || password.isEmpty;
}

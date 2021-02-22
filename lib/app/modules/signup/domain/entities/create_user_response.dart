class CreateUserResponse {
  CreateUserResponse({
    this.pokemonList,
    this.id,
    this.name,
    this.email,
    this.created,
    this.v,
  });

  final List<dynamic> pokemonList;
  final String id;
  final String name;
  final String email;
  final DateTime created;
  final int v;

  @override
  String toString() {
    return 'CreateUserResponse(pokemonList: $pokemonList, id: $id, name: $name, email: $email, created: $created, v: $v)';
  }
}

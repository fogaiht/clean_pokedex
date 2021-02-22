import '../../domain/entities/create_user_response.dart';

class CreateUserResponseMapper {
  static CreateUserResponse fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      pokemonList: json["pokemonList"] == null ? null : List<dynamic>.from(json["pokemonList"].map((x) => x)),
      id: json["_id"] == null ? null : json["_id"],
      name: json["name"] == null ? null : json["name"],
      email: json["email"] == null ? null : json["email"],
      created: json["created"] == null ? null : DateTime.parse(json["created"]),
      v: json["__v"] == null ? null : json["__v"],
    );
  }
}

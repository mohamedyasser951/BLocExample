class BlocUserModel {
  final int id;
  final String firstName;
  final String email;
  final String lastName;
  final String avatar;

  BlocUserModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        firstName = json["first_name"],
        email = json["email"],
        lastName = json['last_name'],
        avatar = json["avatar"];
}

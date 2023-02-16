class UserModel {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"],
        gender = json['gender'],
        status = json["status"];
}

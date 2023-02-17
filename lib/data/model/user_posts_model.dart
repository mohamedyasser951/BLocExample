
class UserPostsModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  UserPostsModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["user_id"],
        title = json['title'],
        body = json["body"];
}

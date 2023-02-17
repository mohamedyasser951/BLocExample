import 'package:dio/dio.dart';

class ApiSercices {
  static String baseUrl = "https://gorest.co.in/public/v2/";
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<List<dynamic>> getUsers() async {
    List users = [];
    await dio.get("users").then((value) {
      users = value.data;
    }).catchError((e) {
      throw e.toString();
    });
    return users;
  }

  static Future<List<dynamic>> getUserPost({int? postId}) async {
    List userPost = [];
    await dio.get("users/$postId/posts").then((value) {
      userPost = value.data;
    }).catchError((e) {
      throw e.toString();
    });
    return userPost;
  }
}

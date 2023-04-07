import 'dart:convert';
import 'package:bloc_examples/data/model/bloc_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<BlocUserModel>> getUser() async {
    String endPoint = "https://reqres.in/api/users?page=2";
    var response = await http.get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      List results = jsonDecode(response.body)["data"];
      return results.map((e) => BlocUserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

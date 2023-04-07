import 'package:bloc_examples/data/model/user_model.dart';

abstract class AppStates {}

class InitState extends AppStates {}

// get Users
class GetUsersSucessState extends AppStates {
  final List<UserModel> users;

  GetUsersSucessState({required this.users});
}

class GetUsersLoadingState extends AppStates {}


//get userPosts
class GetUserPostsLoadingState extends AppStates {}
class GetUserPostsSucessState extends AppStates {}


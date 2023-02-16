import 'package:bloc_examples/bloc/states.dart';
import 'package:bloc_examples/data/Api_services/get_users_service.dart';
import 'package:bloc_examples/data/model/user_model.dart';
import 'package:bloc_examples/data/model/user_posts_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<UserModel> users = [];

  getUsers() async {
    emit(GetUsersLoadingState());
    await ApiSercices.getUsers().then((value) {
      for (var element in value) {
        users.add(UserModel.fromJson(element));
      }
      emit(GetUsersSucessState(users: users));
    });
  }

  List<UserPostsModel> userPosts = [];
  getUserPosts({required String postId}) async {
    emit(GetUserPostsLoadingState());

    await ApiSercices.getUserPost().then((value) {
      for (var element in value) {
        userPosts.add(UserPostsModel.fromJson(element));
      }
      print(value);
      emit(GetUserPostsSucessState());
    }).catchError((e) {
      throw e.toString();
    });
  }
}

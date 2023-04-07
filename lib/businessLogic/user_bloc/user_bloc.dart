import 'package:bloc_examples/businessLogic/user_bloc/user_event.dart';
import 'package:bloc_examples/businessLogic/user_bloc/user_states.dart';
import 'package:bloc_examples/data/Repository/user_repo.dart';
import 'package:bloc_examples/data/model/bloc_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<BlocUserEvent, BlocUserStates> {
  UserRepository _userRepository;
  UserBloc(this._userRepository) : super(GetUserLoadingState()) {
    on<BlocLoadUserData>((event, emit) async {
      emit(GetUserLoadingState());
      try {
        List<BlocUserModel> users = await _userRepository.getUser();
        emit(GetUserLoadedState(users: users));
      } catch (e) {
        emit(GetUserErrorState(error: e.toString()));
      }
    });
  }
}

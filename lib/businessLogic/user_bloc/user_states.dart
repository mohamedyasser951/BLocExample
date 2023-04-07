import 'package:bloc_examples/data/model/bloc_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


//  Immutable classes are those whose instances cannot be changed after they are created
@immutable
class BlocUserStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserLoadingState extends BlocUserStates {
  @override
  List<Object?> get props => [];
}

class GetUserLoadedState extends BlocUserStates {
  final List<BlocUserModel> users;
  GetUserLoadedState({required this.users});
  @override
  List<Object?> get props => [users];
}

class GetUserErrorState extends BlocUserStates {
  final String error;
  GetUserErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

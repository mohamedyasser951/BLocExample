import 'package:bloc_examples/bloc/cubit.dart';
import 'package:bloc_examples/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPosts extends StatefulWidget {
  String postId;
  UserPosts({super.key, required this.postId});

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>.value(
      value: AppCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            AppCubit.get(context).getUserPosts(postId: widget.postId);

            var userPosts = AppCubit.get(context).userPosts;
            if (state is GetUserPostsLoadingState) {
              print(userPosts.length);
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: userPosts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: Colors.teal,
                    leading: Text(userPosts[index].id.toString()),
                    title: Text(userPosts[index].title),
                    subtitle: Text(userPosts[index].body),
                  );
                });
          },
        ),
      ),
    );
  }
}

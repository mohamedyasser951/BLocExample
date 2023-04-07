import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_examples/businessLogic/bloc/cubit.dart';
import 'package:bloc_examples/businessLogic/bloc/states.dart';

class UserPosts extends StatefulWidget {
 final int postId;
  const UserPosts({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>.value(
      value: AppCubit(),
      child: Builder(
        builder: (context) {
          AppCubit.get(context).getUserPosts(postId: widget.postId);
          return Scaffold(
            appBar: AppBar(
              title:const Text("UserPost"),
            ),
            body: BlocBuilder<AppCubit, AppStates>(
              builder: (context, state) {
                @override
                var userPosts = AppCubit.get(context).userPosts;
                if (state is GetUserPostsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (userPosts.isEmpty) {
                  return const Center(child: Text("There No Posts"),);
                }
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListView.builder(
                      itemCount: userPosts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Text(userPosts[index].id.toString()),
                          title: Text(userPosts[index].title, maxLines: 2),
                          subtitle: Text(
                            userPosts[index].body,
                            maxLines: 3,
                          ),
                        );
                      }),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

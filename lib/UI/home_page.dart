import 'package:bloc_examples/UI/user_post.dart';
import 'package:bloc_examples/bloc/cubit.dart';
import 'package:bloc_examples/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit()..getUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        body: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var users = AppCubit.get(context).users;
              if (state is GetUsersLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserPosts(postId: users[index].id),
                            ));
                      },
                      child: ListTile(
                        leading: Text(users[index].id.toString()),
                        title: Text(users[index].name),
                        subtitle: Text(users[index].email),
                        // trailing: Text(users[index].status),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

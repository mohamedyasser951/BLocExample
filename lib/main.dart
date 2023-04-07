import 'package:bloc_examples/businessLogic/user_bloc/user_bloc.dart';
import 'package:bloc_examples/businessLogic/user_bloc/user_event.dart';
import 'package:bloc_examples/businessLogic/user_bloc/user_states.dart';
import 'package:bloc_examples/data/Api_services/get_users_service.dart';
import 'package:bloc_examples/data/Repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  ApiSercices.init();
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RepositoryProvider(
          create: (context) => UserRepository(),
          child: const Home(),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of<UserRepository>(context))
            ..add(BlocLoadUserData()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("User Bloc"),
          ),
          body: BlocBuilder<UserBloc, BlocUserStates>(
            builder: (context, state) {
              if (state is GetUserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetUserLoadedState) {
                var results = state.users;
                return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(results[index].firstName),
                    subtitle: Text(results[index].lastName),
                    trailing: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.amber,
                      child: Image(image: NetworkImage(results[index].avatar)),
                    ),
                  ),
                );
              }
              if (state is GetUserErrorState) {
                return const Center(
                  child: Text("Something Went wrong"),
                );
              }
              return Container();
            },
          )),
    );
  }
}

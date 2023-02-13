import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math show Random;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

List names = ["Mohamed", "Nada", "Yasser", "Mosa"];

class HomeCubit extends Cubit<String?> {
    HomeCubit() : super(null);

  void pickeRandomElment() => emit(names.getRandomElement());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit cubit;

  @override
  void initState() {
    cubit = HomeCubit();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: StreamBuilder<String?>(
        stream: cubit.stream,
        builder: (context, snapshot) {
          final button = TextButton(
              onPressed: () {
                cubit.pickeRandomElment();
              },
              child: const Text("Pick Random Name"));

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: button,
              );
            case ConnectionState.waiting:
              return Center(
                child: button,
              );
            case ConnectionState.active:
              return Center(
                child: Column(
                  children: [
                    Text(snapshot.data??""),
                    button
                  ],
                ),
              );

            case ConnectionState.done:
              return const Text("ConnectionState.done");
          }
        },
      ),
    );
  }
}

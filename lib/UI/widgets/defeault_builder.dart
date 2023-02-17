import 'package:flutter/material.dart';

class DefeaultBuilder extends StatelessWidget {
  const DefeaultBuilder({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List  list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text(list[index].id.toString()),
              title: Text(list[index].title, maxLines: 2),
              subtitle: Text(
                list[index].body,
                maxLines: 3,
              ),
            );
          }),
    );
  }
}